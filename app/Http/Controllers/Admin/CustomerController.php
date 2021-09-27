<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Customer;
use App\Models\Country;
use App\Models\Currency;
use App\Models\Language;
use App\Models\Timezone;

class CustomerController extends Controller
{
    protected $stripe;

    public function __construct() 
    {
        $this->stripe = new \Stripe\StripeClient(env('STRIPE_SECRET'));
    }

    public function index()
    {
        return view('customers.index')->withCustomers(Customer::orderBy('created_at','desc')->paginate(10));
    }

    /**
     * Show the Customer.
     *
     * @return mixed
     */
    public function show(Plan $plan, Request $request)
    {   
        $paymentMethods = $request->user()->paymentMethods();

        $intent = $request->user()->createSetupIntent();
        
        return view('plans.show', compact('plan', 'intent'));
    }

    public function create()
    {
        return view('customers.create')
            ->withCountries(Country::get())
            ->withCurrencies(Currency::get())
            ->withTimezones(Timezone::get())
            ->withLanguages(Language::get());
    }

    public function store(Request $request)
    {   
        $request->validate([
            'customer_id' => 'required',
            'name' => 'required',
            'email' => 'required',
            'description' => 'required',
            'phone_no' => 'required',
            'country' => 'required',
            'address_line_1' => 'required',
            'address_line_2' => 'required',
            'postal_code' => 'required',
            'city' => 'required',
            'taxExempt' => 'required'
        ]);

        $data = $request->except('_token');

        try {
            //create stripe customer    
            $resp = $this->stripe->customers->create([
                'name' => request()->name,
                'email' => request()->email,
                'description' => request()->description,
                'phone' => request()->phone_no ? request()->phone_no : '',
                'address' => [
                    'country' => request()->country,
                    'line1' => request()->address_line_1,
                    'line2' => request()->address_line_2,
                    'postal_code' => request()->postal_code,
                    'city' => request()->city
                ],
                'tax_exempt' => request()->taxExempt
            ]);

            if(request()->tax_id) {
                \Stripe\Stripe::setApiKey(env('STRIPE_SECRET'));
                try {
                    \Stripe\Customer::createTaxId(
                        $resp->id,
                        [
                        'type' => request()->tax_id_types,
                        'value' => request()->tax_id,
                        ]
                    );
                } catch(\Exception $e) {
                    return redirect()->back()->withErrors($e->getMessage());        
                }
            }
        } catch(\Exception $e) {
            return redirect()->back()->withErrors($e->getMessage());        
        }
        
        $customer = new Customer();
        $customer->customer_prefix_id = request()->customer_id;
        $customer->customer_stripe_id = $resp->id;
        $customer->name = request()->name;
        $customer->email = request()->email;
        $customer->description = request()->description;
        $customer->phone_no = request()->phone_no;
        $customer->address_line_1 = request()->address_line_1;
        $customer->address_line_2 = request()->address_line_2;
        $customer->postal_code = request()->postal_code;
        $customer->city = request()->city;
        $customer->billing_country = request()->country;
        $customer->billing_email = request()->email;
        $customer->shopping_email = request()->email;
        $customer->shopping_country = request()->country;
        $customer->shopping_tax_status = request()->taxExempt;
        $customer->save();
        return redirect()->route('customer.index')->with('success', 'Customer has been created successfully');
    }
}
