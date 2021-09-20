@extends('layouts.app')
@section('content')
<div class="container">
    <div class="row d-flex justify-content-center">
        <div class="col-md-8">

            @if ($errors->any())
                @foreach ($errors->all() as $error)
                <div class="alert alert-danger">
                    {{ $error }}
                </div>
                @endforeach
            @endif

            <div class="card">
                <div class="card-header">
                    <h5 class="card-title float-left">Create new plan</h5>
                    <a href="{{ route('plans.index') }}" class="btn btn-secondary btn-sm float-right">Back</a>
                </div> 
                <div class="card-body">
                    <form action="{{route('store.plan')}}" method="post" enctype="multipart/form-data">
                        @csrf
                        <div class="row">
                            <div class="col-md-5">
                                <div class="form-group">
                                    <label for="name">Name:<b class="text-danger">*</b></label>
                                    <input type="text" class="form-control" name="name" placeholder="Premium Plan, sunglasses, etc.">
                                </div>    
                            </div>
                            <div class="col-md-7">
                                <div class="form-group">
                                    <label for="cost">Description:</label>
                                    <input type="text" class="form-control" name="description">
                                </div>
                            </div>
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label for="statementDescriptor">Statement descriptor:</label>
                                    <input type="text" class="form-control" name="statementDescriptor" id="statementDescriptor">
                                </div>
                            </div>
                        </div>
                        <hr>
                        <h4 class="text-secondary">Price information</h4>
                        <hr>
                        <div class="row">
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label for="price">Price:<b class="text-danger">*</b></label>
                                    <input type="number" class="form-control alpha-numeric" id="price" name="price" placeholder="0.00">
                                </div>
                            </div>

                            <div class="col-md-4">
                                <div class="form-group">
                                    <label for="currency">Currency:<b class="text-danger">*</b></label>
                                    <select class="form-control" id="currency" name="currency">
                                        <option value="" selected disabled>Choose an option</option>    
                                        <option value="usd">USD</option>
                                        <option value="egp">EGP</option>
                                        <option value="gbp">GBP</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label for="interval">Billing period:<b class="text-danger">*</b></label>
                                    <select class="form-control" id="interval" name="interval">
                                        <option value="" selected disabled>Choose an option</option>        
                                        <option value="day">Daily</option>
                                        <option value="week">Weekly</option>
                                        <option value="month">Monthly</option>
                                        <option value="quarter">Every 3 months</option>
                                        <option value="semiannual">Every 6 months</option>
                                        <option value="year">Yearly</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <button type="submit" class="btn btn-primary">Submit</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection