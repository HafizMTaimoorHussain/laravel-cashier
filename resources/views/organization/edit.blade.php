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
                    <h5 class="card-title float-left">Edit organization</h5>
                    <a href="{{ route('organization.index') }}" class="btn btn-secondary btn-sm float-right">Back</a>
                </div> 
                <div class="card-body">
                    <form action="{{route('organization.update', $organization)}}" method="post" enctype="multipart/form-data">
                        {{ method_field('put') }}
                        {{ csrf_field() }}
                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label for="name">Name:<b class="text-danger">*</b></label>
                                    <input type="text" class="form-control" name="name" value="{{ $organization->name }}">
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