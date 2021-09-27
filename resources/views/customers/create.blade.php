@extends('layouts.app')
@section('content')
<div class="container">

    @if ($errors->any())
        @foreach ($errors->all() as $error)
        <div class="alert alert-danger">    
            {{ $error }}
        </div>
        @endforeach
    @endif

    <div class="card">
        <div class="card-header">
            <h5 class="card-title float-left">Create new customer</h5>
            <a href="{{ route('customer.index') }}" class="btn btn-secondary btn-sm float-right">Back</a>
        </div>    
        <div class="card-body">
            <form action="{{route('store.customer')}}" method="post">
                @csrf
                <div class="row">
                    <div class="col-md-4">
                        <div class="form-group">
                            <label for="customer_id">Customer ID:<b class="text-danger">*</b></label>
                            <input type="text" class="form-control" name="customer_id"s id="customer_id" placeholder="CUS-0001"> 
                        </div>    
                    </div>
                    <div class="col-md-4">
                        <div class="form-group">
                            <label for="name">Name:<b class="text-danger">*</b></label>
                            <input type="text" class="form-control" name="name" placeholder="Jane Doe">
                        </div>    
                    </div>
                    <div class="col-md-4">
                        <div class="form-group">
                            <label for="email">Email:<b class="text-danger">*</b></label>
                            <input type="email" class="form-control" name="email" placeholder="Jane@example.com">
                        </div>
                    </div>
                    <div class="col-md-8">
                        <div class="form-group">
                            <label for="description">Description:<b class="text-danger">*</b></label>
                            <input type="text" class="form-control" name="description" id="description">
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="form-group">
                            <label for="phone_no">Phone No#:</label>
                            <input type="text" class="form-control" id="phone_no" name="phone_no">
                        </div>
                    </div>
                </div>
                <hr>
                <h5 class="text-secondary">Billing Information</h5>
                <hr>
                <div class="row">
                    <div class="col-md-4">
                        <div class="form-group">
                            <label for="country">Country:<b class="text-danger">*</b></label>
                            <select class="form-control" id="country" name="country">
                                @if(count($countries) > 0)
                                <option selected disabled>Choose a country</option>
                                    @foreach($countries as $country)
                                    <option value="{{ $country->name }}">{{ $country->name }}</option>
                                    @endforeach
                                @endif
                            </select>
                        </div>    
                    </div>    
                    <div class="col-md-4">
                        <div class="form-group">
                            <label for="address_line_1">Address Line 1:<b class="text-danger">*</b></label>
                            <input type="text" class="form-control" id="address_line_1" name="address_line_1">
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="form-group">
                            <label for="address_line_2">Address Line 2:<b class="text-danger">*</b></label>
                            <input type="text" class="form-control" id="address_line_2" name="address_line_2">
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="form-group">
                            <label for="postal_code">Postal Code:<b class="text-danger">*</b></label>
                            <input type="number" class="form-control" id="postal_code" name="postal_code">
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="form-group">
                            <label for="city">City:<b class="text-danger">*</b></label>
                            <input type="text" class="form-control" id="city" name="city">
                        </div>
                    </div>
                </div>
                <hr>
                <h5 class="text-secondary">Shipping Information</h5>
                <hr>
                <div class="row">
                    <div class="col-md-4">
                        <div class="form-group">
                            <label for="shipping_country">Country:</label>
                            <select class="form-control" id="shipping_country" name="shipping_country">
                                @if(count($countries) > 0)
                                <option selected disabled>Choose a country</option>
                                    @foreach($countries as $country)
                                    <option value="{{ $country->name }}">{{ $country->name }}</option>
                                    @endforeach
                                @endif
                            </select>
                        </div>    
                    </div>    
                    <div class="col-md-4">
                        <div class="form-group">
                            <label for="shipping_address_line_1">Address Line 1:</label>
                            <input type="text" class="form-control" id="shipping_address_line_1" name="shipping_address_line_1">
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="form-group">
                            <label for="shipping_address_line_2">Address Line 2:</label>
                            <input type="text" class="form-control" id="shipping_address_line_2" name="shipping_address_line_2">
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="form-group">
                            <label for="shipping_postal_code">Postal Code:</label>
                            <input type="number" class="form-control" id="shipping_postal_code" name="shipping_postal_code">
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="form-group">
                            <label for="shipping_city">City:</label>
                            <input type="text" class="form-control" id="shipping_city" name="shipping_city">
                        </div>
                    </div>
                </div>
                <hr>
                <h5 class="text-secondary">Tax</h5>
                <hr>
                <div class="row">
                    <div class="col-md-4">
                        <div class="form-group">
                            <label for="taxExempt">Tax status:</b></label>
                            <select class="form-control" id="taxExempt" name="taxExempt">
                                <option selected disabled>Choose an option</option>
                                <option value="none">Taxable</option>
                                <option value="exempt">Exempt</option>
                                <option value="reverse">Reverse charge</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="form-group">
                            <label for="tax_id_types">Tax ID Types:</label>
                            <select class="form-control" id="tax_id_types" name="tax_id_types">
                                <option selected disabled>Choose an option</option>
                                <option value="au_abn">Australian Business Number (AU ABN)</option>
                                <option value="au_arn">Australian Taxation Office Reference Number</option>
                                <option value="eu_vat">European VAT number</option>
                                <option value="br_cnpj">Brazilian CNPJ number</option>
                                <option value="br_cpf">Brazilian CPF number</option>
                                <option value="eu_vat">European VAT number</option>
                                <option value="ca_bn">Canadian BN</option>
                                <option value="ca_gst_hst">Canadian GST/HST number</option>
                                <option value="ca_pst_bc">Canadian PST number (British Columbia)</option>
                                <option value="ca_pst_mb">Canadian PST number (Manitoba)</option>
                                <option value="ca_pst_sk">Canadian PST number (Saskatchewan)</option>
                                <option value="ca_qst">Canadian QST number (Québec)</option>
                                <option value="cl_tin">Chilean TIN</option>
                                <option value="eu_vat">European VAT number</option>
                                <option value="eu_vat">European VAT number</option>
                                <option value="ch_vat">Switzerland VAT number</option>
                                <option value="tw_vat">Taiwanese VAT</option>
                                <option value="th_vat">Thai VAT</option>
                                <option value="ae_trn">United Arab Emirates TRN</option>
                                <option value="gb_vat">United Kingdom VAT number</option>
                                <option value="eu_vat">Northern Ireland VAT number</option>
                                <option value="us_ein">United States EIN</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="form-group">
                            <label for="tax_id">Tax ID:</label>
                            <input type="text" class="form-control" id="tax_id" name="tax_id">
                        </div>
                    </div>
                </div>
                <button type="submit" class="btn btn-primary">Submit</button>
            </form>
        </div>
    </div>
</div>
@endsection