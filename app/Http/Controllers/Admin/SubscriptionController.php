<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Customer;
use App\Models\Currency;
use App\Models\Organization;
use App\Models\Plan;
use App\Models\Subscription;

use Illuminate\Http\Request;
use Carbon\Carbon;

class SubscriptionController extends Controller
{
    protected $stripe;

    public function __construct() 
    {
      $this->stripe = new \Stripe\StripeClient(env('STRIPE_SECRET'));
    }
    
    public function index(Request $request) 
    {
        $subscriptions = Subscription::with('user','customer', 'organization', 'account')->orderBy('created_at','desc');

        if (!empty($request->all())) {
            if ($request->has('customer_prefix_id') && !empty(request()->customer_prefix_id)) {
              $subscriptions = $subscriptions->whereHas('customer', function ($q) {
                  $q->where('id', request()->customer_prefix_id);
              });
            }

            if ($request->has('customer_name') && !empty(request()->customer_name)) {
              $subscriptions = $subscriptions->whereHas('customer', function ($q) use ($request) {
                $q->where('name', 'LIKE', "%$request->customer_name%");
              });
            }

            if($request->has('service_name') && !empty($request->service_name)){
              $subscriptions = $subscriptions->where('product_name', 'LIKE', "%$request->service_name%");
            }

            if($request->has('recurring') && !empty($request->recurring)){
              $subscriptions = $subscriptions->where('recurring', 'LIKE', "%$request->recurring%");
            }
        }
        $subscriptions = $subscriptions->paginate(10);
        // dd($subscriptions);
        return view('subscription.index')->withSubscriptions($subscriptions);
    }

    public function create() 
    {
        $customer = Customer::where('id',1)->get()->first();
        $intent = $customer->createSetupIntent();
        // dd($customer);
        return view('subscription.create')
            ->withCustomers(Customer::orderBy('id','desc')->get())
            ->withProducts(Plan::orderBy('id','desc')->get())
            ->withCurrencies(Currency::get())
            ->withOrganizations(Organization::get())
            ->withIntent($intent);
    }

    public function store(Request $request) 
    {
      $request->validate([
        'mode' => 'required',
        'organization' => 'required',
        'account' => 'required',
        'customer' => 'required',
        'service' => 'required',
        'custom_price_option' => 'required',
        'price' => 'sometimes|required',
        'currency' => 'required',
        'recurring' => 'required',
        'sales_rep' => 'required',
        'cfid' => 'required'
      ]);
      // dd(request()->all());

      try {
        $plan = Plan::where('slug', request()->service)->get()->first();
        $customer = Customer::where('id', request()->customer)->get()->first();

        $price = null;
        if(request()->custom_price_option == "yes") {
          $price = (request()->price * 100);
        } else {
          $price = ($plan->price * 100);
        }
        if(request()->mode == "online") {
          \Stripe\Stripe::setApiKey(env('STRIPE_SECRET'));
          
          $paymentMethod = request()->paymentMethod;
          // dd($paymentMethod);
          // $customer->defaultPaymentMethod();
          // $customer->createOrGetStripeCustomer();
          // dd($customer);

          $customer_payment_method = $this->stripe->paymentMethods->attach(
            $paymentMethod,
            ['customer' => $customer->customer_stripe_id]
          );

          // dd($customer_payment_method);
          // $customer->updateDefaultPaymentMethod($paymentMethod);

          $Interval = '';
          $IntervalCount = '';
          if(request()->recurring == "quarter") {
              $Interval = "month";
              $IntervalCount = 3;
          } else if(request()->recurring == "semiannual") {
              $Interval = "month";
              $IntervalCount = 6;
          }
          else {
              $Interval = request()->recurring;
              $IntervalCount = 1;
          }

          $useCurrency = '';
          $customerCurrency = Subscription::where('customer_stripe_id', $customer->customer_stripe_id)->orderBy('id','desc')->get()->first();
          if(isset($customerCurrency) && !empty($customerCurrency)) {
            $useCurrency = $customerCurrency->currency;
          } else {
            $useCurrency = request()->currency;
          }
           
          $subscription = \Stripe\Subscription::create([
            'customer' => $customer_payment_method->customer,
            "default_payment_method" => $paymentMethod,
            "trial_end" => null,
            'items' => [[
              'price_data' => [
                'unit_amount' => $price,
                'currency' => $useCurrency,
                'product' => trim($plan->product_id),
                'recurring' => [
                  'interval' => $Interval,
                  'interval_count' => $IntervalCount
                ],
              ],
            ]],

          ]);

        }

        // dd( $subscription);
  
        $endDate = "";
        $recurringValue = "";
        if(request()->recurring == "day") {
          $endDate = Carbon::now()->addDay();
          $recurringValue = "Daily";
        } else if(request()->recurring == "week") {
          $endDate = Carbon::now()->addDay(7);
          $recurringValue = "Weekly";
        } else if(request()->recurring == "month") {
          $endDate = Carbon::now()->addDay(30);
          $recurringValue = "Monthly";
        } else if(request()->recurring == "three_of_month") {
          $endDate = Carbon::now()->addDay(90);
          $recurringValue = "Every 3 months";
        } else if(request()->recurring == "semiannual") {
          $endDate = Carbon::now()->addDay(180);
          $recurringValue = "Every 6 months";
        } else {
          $endDate = Carbon::now()->addDay(365);
          $recurringValue = "Yearly";
        }
        
        $newSubscription = new Subscription();
        $newSubscription->stripe_subscription_id = request()->mode != "online" ? null : $subscription->id;
        $newSubscription->product_id = trim($plan->product_id);
        $newSubscription->product_name = $plan->name;
        $newSubscription->stripe_price = request()->mode != "online" ? null : $subscription->plan->id;
        $newSubscription->stripe_status = request()->mode != "online" ? 'active' : $subscription->status;
        $newSubscription->price = $price / 100;
        $newSubscription->currency = request()->mode == "online" ? $useCurrency : request()->currency;
        $newSubscription->recurring = $recurringValue;
        $newSubscription->next_invoice_date = request()->mode != "online" ? $endDate->toFormattedDateString() : Carbon::createFromTimeStamp($subscription->current_period_end)->toFormattedDateString();
        $newSubscription->customer_stripe_id = $customer->customer_stripe_id;
        $newSubscription->created_by = auth()->user()->id;
        $newSubscription->sales_rep = request()->sales_rep;
        $newSubscription->cfid = request()->cfid;
        $newSubscription->status = request()->mode != "online" ? 'Offline' : 'Online';
        $newSubscription->payment_status = request()->mode == "online" ? 1 : 0;
        $newSubscription->organization_id = request()->organization;
        $newSubscription->account_id = request()->account;
        $newSubscription->save();

        return redirect()->route('subscription.index')->with('success', 'Your subscription created successfully');

      } catch(\Exception $e) {
        return redirect()->back()->withErrors($e->getMessage());
      }

    }

    public function update_payment_status() {
      try {
        $update_Subscription = Subscription::find(request()->hidden_subcsription_id);
        $update_Subscription->payment_status = request()->payment_status;
        $update_Subscription->save();
        return redirect()->route('subscription.index')->with('success', 'Payment status updated successfully.');
      } catch(\Exception $e) {
        return redirect()->back()->withErrors($e->getMessage());
      }

    }

    public function setCustomerIntent() 
    {
        $customer = Customer::where('id',request()->cid)->get()->first();
        $paymentMethods = $customer->paymentMethods();
        $intent = $customer->createSetupIntent();
        return ['status' => true, 'intent' => $intent->client_secret];
    }

    public function account_wise_listing(Request $request) 
    {
        $subscriptions = Subscription::with('organization', 'account')->groupBy('account_id')->orderBy('created_at','desc');
        $subscriptions = $subscriptions->paginate(10);
        // dd($subscriptions);
        return view('subscription.account_wise_listing')->withSubscriptions($subscriptions);
    }
}
