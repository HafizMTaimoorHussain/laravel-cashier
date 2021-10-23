<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Plan;
use App\Models\User;

class ProductController extends Controller
{
    protected $stripe;

    public function __construct() 
    {
        $this->stripe = new \Stripe\StripeClient(env('STRIPE_SECRET'));
    }

    public function index()
    {
        return view('plans.index')->withPlans(Plan::orderBy('created_at', 'desc')->paginate(10));
    }

    public function create(Request $request, Plan $plan)
    {
        return view('plans.create');
    }

    public function store(Request $request)
    {   
        $request->validate([
            'name' => 'required',
            'price' => 'required',
            'currency' => 'required',
            'interval' => 'required'
        ]);

        try {
            $data = $request->except('_token');

            $data['slug'] = strtolower($data['name']);
            $price = $data['price'] * 100; 

            //create stripe product
            $newProduct = $this->stripe->products->create([
                'name' => $data['name'],
                'statement_descriptor' => request()->statementDescriptor ? request()->statementDescriptor : '',
            ]);
            
            //Stripe Plan Creation
            $Interval = '';
            $IntervalCount = '';
            if(request()->interval == "quarter") {
                $Interval = "month";
                $IntervalCount = 3;
            } else if(request()->interval == "semiannual") {
                $Interval = "month";
                $IntervalCount = 6;
            }
            else {
                $Interval = request()->interval;
                $IntervalCount = 1;
            }

            $newprice = $this->stripe->prices->create([
                'product' => $newProduct->id,
                'unit_amount' => $price,
                'currency' => request()->currency
            ]);
            // dd($newprice);

            $data['stripe_plan'] = $newprice->id;
            $data['product_id'] = $newProduct->id;
            Plan::create($data);
            return redirect()->route('plans.index')->with('success', 'Plan has been created successfully');
        } catch(\Exception $e) {
            return redirect()->back()->with('error', $exception);
        }

        

        // try {
        //     $data = $request->except('_token');

        //     $data['slug'] = strtolower($data['name']);
        //     $price = $data['price'] * 100; 

        //     //create stripe product
        //     $newProduct = $this->stripe->products->create([
        //         'name' => $data['name'],
        //         'statement_descriptor' => request()->statementDescriptor ? request()->statementDescriptor : '',
        //     ]);
            
        //     //Stripe Plan Creation
        //     $Interval = '';
        //     $IntervalCount = '';
        //     if(request()->interval == "quarter") {
        //         $Interval = "month";
        //         $IntervalCount = 3;
        //     } else if(request()->interval == "semiannual") {
        //         $Interval = "month";
        //         $IntervalCount = 6;
        //     }
        //     else {
        //         $Interval = request()->interval;
        //         $IntervalCount = 1;
        //     }

        //     $newprice = $this->stripe->prices->create([
        //         'product' => $newProduct->id,
        //         'unit_amount' => $price,
        //         'currency' => request()->currency
        //     ]);
        //     // dd($newprice);

        //     $data['stripe_plan'] = $newprice->id;
        //     $data['product_id'] = $newProduct->id;
        //     Plan::create($data);
        //     return redirect()
        //         ->route('plans.index')
        //         ->with('success', 'Plan has been created successfully');
        // } catch(\Exception $exception) {
        //     return redirect()
        //         ->back()
        //         ->with('error', $exception);
        // }
    }

    /**
     * Show the Plan.
     *
     * @return mixed
     */
    public function show(Plan $plan, Request $request)
    {   
        return view('plans.show')->withPlan($plan)->withIntent($request->user()->createSetupIntent());
    }
}