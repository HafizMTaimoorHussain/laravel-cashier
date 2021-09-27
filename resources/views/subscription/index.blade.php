@extends('layouts.app')
@section('content')
<div class="container">
    <div class="row d-flex justify-content-center">
        <div class="col-md-12">
            
            @if(session()->has('success'))
                <div class="alert alert-success">
                    {{ session()->get('success') }}
                </div>
            @endif

            <div class="card">
                <div class="card-header">
                    <a class="text-secondary text-decoration-none">
                        <strong>Filters</strong>
                    </a>
                    <span class="fa fa-plus float-right" data-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample"></span>
                </div>
            </div>
            <div class="card mb-3 collapse" id="collapseExample">
                <div class="card-body">
                    <form method="POST" action="{{ route('subscription.index') }}">
                        @csrf
                        <div class="row">
                            <div class="col-md-3">
                                <div class="form-group">
                                    <label for="customer_prefix_id">Customer ID#</label>
                                    <input type="text" class="form-control" name="customer_prefix_id" id="customer_prefix_id">
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="form-group">
                                    <label for="customer_name">Customer Name</label>
                                    <input type="text" class="form-control" name="customer_name" id="customer_name">
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="form-group">
                                    <label for="service_name">Service Name</label>
                                    <input type="text" class="form-control" name="service_name" id="service_name">
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="form-group">
                                    <label for="recurring">Recurring Name</label>
                                    <select class="form-control" name="recurring" id="recurring">
                                        <option selected disabled>Choose an option</option>
                                        <option value="day">Daily</option>
                                        <option value="week">Weekly</option>
                                        <option value="month">Monthly</option>
                                        <option value="three_of_month">Every 3 months</option>
                                        <option value="semiannual">Every 6 months</option>
                                        <option value="year">Yearly</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="d-flex justify-content-end">
                            <a href="{{ route('subscription.index') }}" class="btn btn-secondary btn-sm">
                                Clear
                            </a>    
                            <button type="submit" class="btn btn-secondary btn-sm ml-2">
                                Filter
                            </button>
                        </div>
                    </form>
                </div>
            </div>

            <div class="card mt-3">
                <div class="card-header">
                    <h5 class="text-secondary modal-title float-left">Subscription listing <span class="badge badge-secondary"> {{ $subscriptions->count() }} </span> </h5>
                    <a href="{{ route('create.subscription') }}" class="btn btn-secondary btn-sm float-right">Add</a>
                </div>
                <div class="card-body">
                    <table class="table table-hover table-striped table-responsive">
                        <thead>
                            <tr>
                                <th scope="col">#</th>
                                <th scope="col">Mode</th>
                                <th scope="col">Status</th>
                                <th scope="col">Subscription ID </th>
                                <th scope="col">Service ID</th>
                                <th scope="col">Service Name</th>
                                <th scope="col">Customer ID</th>
                                <th scope="col">Customer Name</th>
                                <th scope="col">Amount</th>
                                <th scope="col">Recurring</th>
                                <th scope="col">Ending Date</th>
                                <th scope="col">Created By</th>
                                <th scope="col">Created At</th>
                                <th scope="col">Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            @if(count($subscriptions) > 0)
                                @php
                                    $count = 1;
                                @endphp
                                @foreach($subscriptions as $subscription)
                                    <tr>
                                        <th scope="row">{{ $count++ }}</th>
                                        <td>
                                            <span class="p-1 badge {{ $subscription->status == 'Online' ? 'badge-success' : 'badge-secondary' }} ">
                                                {{ $subscription->status }}
                                            </span>
                                        </td>
                                        <td>
                                            <span class="p-1 badge {{ $subscription->payment_status == 1 ? 'badge-success' : 'badge-secondary' }} ">
                                                {{ $subscription->payment_status == 1 ? 'Paid' : 'Unpaid' }}
                                            </span>
                                        </td>
                                        <td>{{ isset($subscription->stripe_subscription_id) && !empty($subscription->stripe_subscription_id) ? $subscription->stripe_subscription_id : '---' }}</td>
                                        <td>{{ isset($subscription->product_id) && !empty($subscription->product_id) ? $subscription->product_id : '---' }}</td>
                                        <td>{{ isset($subscription->product_name) && !empty($subscription->product_name) ? ucfirst($subscription->product_name) : '---' }}</td>
                                        <td>{{ isset($subscription->customer_stripe_id) && !empty($subscription->customer_stripe_id) ? $subscription->customer_stripe_id : '---' }}</td>
                                        <td>{{ isset($subscription->customer_stripe_id) && !empty($subscription->customer_stripe_id) ? ucfirst($subscription->customer->name) : '---' }}</td>
                                        <td>{{ isset($subscription->currency) && !empty($subscription->currency) ? ucfirst($subscription->currency) : '' }} {{ isset($subscription->price) && !empty($subscription->price) ? number_format($subscription->price, 2) : '0.00' }}</td>
                                        <td>{{ isset($subscription->recurring) && !empty($subscription->recurring) ? ucfirst($subscription->recurring) : '---' }}</td>
                                        <td>{{ isset($subscription->next_invoice_date) && !empty($subscription->next_invoice_date) ? $subscription->next_invoice_date : '---' }}</td>
                                        <td>{{ isset($subscription->created_by) && !empty($subscription->created_by) ? ucfirst($subscription->user->name) : '---' }}</td>
                                        <td>{{ $subscription->created_at->diffForHumans() }}</td>
                                        <td>
                                            <a href="javascript:void(0)" class="btn btn-warning btn-sm {{ $subscription->payment_status == 1 ? 'd-none' : '' }} payment_status_btn"  data-toggle="modal" data-target="#payment-status" data-subscription_id="{{ $subscription->id }}" id="payment_status_btn">
                                                <i class="fa fa-pencil"></i>
                                            </a>
                                        </td>
                                    </tr>
                                @endforeach
                                @else
                                    <tr>
                                        <td colspan="100%" class="text-center">
                                            No subscriptions yet.
                                        </td>
                                    </tr>
                                @endif
                        </tbody>
                    </table>
                </div>
                @if(count($subscriptions) > 0)
                    <div class="card-footer d-flex justify-content-end">
                        {{ $subscriptions->links("pagination::bootstrap-4") }}
                    </div>
                @endif
            </div>
        </div>
    </div>
</div>
<x-payment-status-modal></x-payment-status-modal>
@endsection
@push('scripts')
<script>
    $(document).ready(function() {
        $('.payment_status_btn').on('click', function() {
            $('#hidden_subcsription_id').val($(this).data('subscription_id'));
        });
    });
</script>
@endpush