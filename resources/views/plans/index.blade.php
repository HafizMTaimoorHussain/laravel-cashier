@extends('layouts.app')
@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-12">
            
            @if(session()->has('success'))
                <div class="alert alert-success mb-4 mt-3">
                    {{ session()->get('success') }}
                </div>
            @endif

            <div class="card">
                <div class="card-header">
                    <h5 class="card-title float-left">Plan listing <span class="badge badge-secondary"> {{ $plans->count() }} </span></h5>
                    <a href="{{ route('create.plan') }}" class="btn btn-secondary btn-sm float-right">Add</a>
                </div>
                <div class="card-body">
                    <table class="table table-hover table-striped">
                        <thead>
                            <tr>
                                <th scope="col">#</th>
                                <th scope="col">Plan ID</th>
                                <th scope="col">Name</th>
                                <th scope="col">Description</th>
                                <th scope="col">Price</th>
                                <th scope="col">Created at</th>
                            </tr>
                        </thead>
                        <tbody>
                            @if(count($plans) > 0)
                                @php
                                    $count = 1;
                                @endphp
                                @foreach($plans as $plan)
                                    <tr>
                                        <th scope="row">
                                            {{ $count++ }}
                                        </th>
                                        <td>
                                            {{ isset($plan->stripe_plan) && !empty($plan->stripe_plan) ? $plan->stripe_plan : '---' }}
                                        </td>
                                        <td>
                                            {{ isset($plan->name) && !empty($plan->name) ? $plan->name : '---' }}
                                        </td>
                                        <td>
                                            {{ isset($plan->description) && !empty($plan->description) ? $plan->description : '---' }}
                                        </td>
                                        <td>
                                            ${{ isset($plan->price) && !empty($plan->price) ? number_format($plan->price, 2) : '---' }}
                                        </td>
                                        <td>
                                            {{ $plan->created_at->diffForHumans() }}
                                        </td>
                                    </tr>
                                @endforeach
                                @else
                                    <tr>
                                        <td colspan="100%" class="text-center">
                                            No plans yet.
                                        </td>
                                    </tr>
                                @endif
                        </tbody>
                    </table>    
                </div>
                @if($plans->count() > 0)
                    <div class="card-footer d-flex justify-content-end">
                        {{ $plans->links("pagination::bootstrap-4") }}
                    </div>
                @endif
            </div>
        </div>
    </div>
</div>
@endsection