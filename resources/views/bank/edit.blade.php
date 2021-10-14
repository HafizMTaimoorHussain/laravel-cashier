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
                    <h5 class="card-title float-left">Edit bank</h5>
                    <a href="{{ route('bank.index') }}" class="btn btn-secondary btn-sm float-right">Back</a>
                </div> 
                <div class="card-body">
                    <form action="{{route('bank.update', $bank)}}" method="post" enctype="multipart/form-data">
                        {{ method_field('put') }}
                        {{ csrf_field() }}
                        <div class="row">
                            <div class="col-md-6">
                                <label for="name">Organization:<b class="text-danger">*</b></label>
                                <select class="form-control" name="organization">
                                    @if($organizations->count() > 0)
                                        <option selected disabled>Choose an option</option>
                                        @foreach($organizations as $organization)
                                            <option value="{{ $organization->id }}" {{ $bank->organization_id == $organization->id ? 'selected' : null}}>{{ $organization->name }}</option>
                                        @endforeach
                                    @else
                                        <option selected disabled>No organization found.</option>
                                    @endif
                                </select>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="name">Name:<b class="text-danger">*</b></label>
                                    <input type="text" class="form-control" name="name" value="{{ $bank->name }}">
                                </div>    
                            </div>
                        </div>
                        <button type="submit" class="btn btn-warning">Update</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection