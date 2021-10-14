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
                    <h5 class="card-title float-left">Organization listing <span class="badge badge-secondary"> {{ $organizations->count() }} </span></h5>
                    <a href="{{ route('organization.create') }}" class="btn btn-secondary btn-sm float-right">Add</a>
                </div>
                <div class="card-body">
                    <table class="table table-hover table-striped">
                        <thead>
                            <tr>
                                <th scope="col">#</th>
                                <th scope="col">Name</th>
                                <th scope="col">Created at</th>
                                <th scope="col">Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            @if(count($organizations) > 0)
                                @php
                                    $count = 1;
                                @endphp
                                @foreach($organizations as $organization)
                                    <tr>
                                        <th scope="row">
                                            {{ $count++ }}
                                        </th>
                                        <td>
                                            {{ ucfirst($organization->name) }}
                                        </td>
                                        <td>
                                            {{ $organization->created_at->diffForHumans() }}
                                        </td>
                                        <td>
                                            <form action="{{ route('organization.destroy',$organization) }}" method="POST" >
                                                <a href="{{ route('organization.edit', $organization) }}" class="btn btn-warning btn-sm">
                                                    Edit
                                                </a>
                                                @csrf
                                                @method('DELETE')
                                                <button type="submit" class="btn btn-danger btn-sm" onclick="return confirm('Are you sure you want to delete?')">Delete</button>
                                            </form>
                                        </td>
                                    </tr>
                                @endforeach
                                @else
                                    <tr>
                                        <td colspan="100%" class="text-center">
                                            No organizations yet.
                                        </td>
                                    </tr>
                                @endif
                        </tbody>
                    </table>    
                </div>
                @if($organizations->count() > 0)
                    <div class="card-footer d-flex justify-content-end">
                        {{ $organizations->links("pagination::bootstrap-4") }}
                    </div>
                @endif
            </div>
        </div>
    </div>
</div>
@endsection