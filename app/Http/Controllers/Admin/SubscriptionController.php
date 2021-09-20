<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Customer;
use App\Models\Currency;
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

    public function index() 
    {
        $subscriptions = Subscription::with('user','customer')->orderBy('created_at','desc')->paginate(10);
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
            ->withIntent($intent);
    }

    public function store(Request $request) 
    {
      $request->validate([
        'mode' => 'required',
        'customer' => 'required',
        'service' => 'required',
        'price' => 'required',
        'currency' => 'required',
        'recurring' => 'required',
      ]);

      $plan = Plan::where('slug',request()->service)->get()->first();
      $customer = Customer::where('id',request()->customer)->get()->first();
      
      try {
        if(request()->mode == "online") {
          \Stripe\Stripe::setApiKey(env('STRIPE_SECRET'));
          
          $paymentMethod = request()->paymentMethod;
          $customer->createOrGetStripeCustomer();
          $customer->updateDefaultPaymentMethod($paymentMethod);
          
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

          $customerCurrency = Subscription::where('customer_stripe_id', $customer->stripe_id)->get()->first();
          $subscription = \Stripe\Subscription::create([
            'customer' => $customer->stripe_id,
            'items' => [[
              'price_data' => [
                'unit_amount' => request()->price,
                'currency' => empty($customerCurrency->currency) ? request()->currency : $customerCurrency->currency,
                'product' => trim($plan->product_id),
                'recurring' => [
                  'interval' => $Interval,
                  'interval_count' => $IntervalCount
                ],
              ],
            ]],
          ]);
        }
  
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
        $newSubscription->price = request()->price;
        $newSubscription->currency = empty($customerCurrency->currency) ? request()->currency : $customerCurrency->currency;
        $newSubscription->recurring = $recurringValue;
        $newSubscription->next_invoice_date = request()->mode != "online" ? $endDate->toFormattedDateString() : Carbon::createFromTimeStamp($subscription->current_period_end)->toFormattedDateString();
        $newSubscription->customer_stripe_id = $customer->stripe_id;
        $newSubscription->created_by = auth()->user()->id;
        $newSubscription->status = request()->mode != "online" ? 'Offline' : 'Online';
        $newSubscription->save();

        return redirect()->route('subscription.index')->with('success', 'Your subscription created successfully');

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
}
