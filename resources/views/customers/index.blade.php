@extends('layouts.app')
    @section('content')
        <div class="container">

            @if ($message = Session::get('success'))
                <div class="alert my-2 alert-success">
                    <p>{{ $message }}</p>
                </div>
            @endif

            <div class="card">
                <div class="card-header">
                    <h5 class="card-title float-left">Customer listing <span class="badge badge-secondary"> {{ $customers->count() }} </span></h5>
                    <a href="{{ route('create.customer') }}" class="btn btn-secondary btn-sm float-right">Add</a>
                </div>    
                <div class="card-body">
                    <table class="table table-hover table-striped">
                        <thead>
                            <tr>
                                <th scope="col">#</th>
                                <th scope="col">ID</th>
                                <th scope="col">Stripe ID</th>
                                <th scope="col">Name</th>
                                <th scope="col">Email</th>
                                <th scope="col">Country</th>
                                <th scope="col">Tax Status</th>
                                <th scope="col">Created At</th>
                            </tr>
                        </thead>
                        <tbody>
                            @if(count($customers) > 0)
                            @php
                                $count = 1;
                            @endphp
                                @foreach($customers as $customer)
                                    <tr>
                                        <th scope="row">
                                            {{ $count++ }}
                                        </th>
                                        <td>
                                            {{ isset($customer->customer_prefix_id) && !empty($customer->customer_prefix_id) ? $customer->customer_prefix_id : '---' }}
                                        </td>
                                        <td>
                                            {{ isset($customer->customer_stripe_id) && !empty($customer->customer_stripe_id) ? $customer->customer_stripe_id : '---' }}
                                        </td>
                                        <td>
                                            {{ isset($customer->name) && !empty($customer->name) ? $customer->name : '---' }}
                                        </td>
                                        <td>
                                            {{ isset($customer->email) && !empty($customer->email) ? $customer->email : '---' }}
                                        </td>
                                        <td>
                                            {{ isset($customer->billing_country) && !empty($customer->billing_country) ? $customer->billing_country : '---' }}
                                        </td>
                                        <td>
                                            {{ isset($customer->shopping_tax_status) && !empty($customer->shopping_tax_status) ? $customer->shopping_tax_status : '---' }}
                                        </td>
                                        <td>
                                            {{ $customer->created_at->diffForHumans() }}
                                        </td>
                                    </tr>
                                @endforeach
                                @else
                                    <tr>
                                        <td colspan="100%" class="text-center">
                                            No customers yet.
                                        </td>
                                    </tr>
                                @endif
                        </tbody>
                    </table>
                </div>
                @if($customers->count() > 0)
                    <div class="card-footer d-flex justify-content-end">
                        {{ $customers->links("pagination::bootstrap-4") }}
                    </div>
                @endif
            </div>
        </div>
    @endsection