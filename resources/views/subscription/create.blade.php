@extends('layouts.app')
@section('content')
<div class="container">
    <div class="row d-flex justify-content-center">
        <div class="col-md-10">

            @if ($errors->any())
                @foreach ($errors->all() as $error)
                <div class="alert alert-danger">
                    {{ $error }}
                </div>
                @endforeach
            @endif

            <div class="card">
                <div class="card-header">
                    <h5 class="text-secondary modal-title float-left">Create new subscription</h5>
                    <a href="{{ route('subscription.index') }}" class="btn btn-secondary btn-sm float-right">Back</a>
                </div>
                <form action="{{ route('subscription.store') }}" method="post" id="payment-form">
                    @csrf
                    <input type="hidden" id="secret">
                    <div class="card-body">
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="mode">Subscription Mode:<b class="text-danger">*</b></label>
                                    <select class="form-control" id="mode" name="mode">
                                        <option selected disabled>Choose an option</option>
                                        <option value="online">Online</option>
                                        <option value="offline">Offline</option>
                                    </select>
                                </div>    
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="customer">Choose a customer:<b class="text-danger">*</b></label>
                                    <select class="form-control" id="customer" name="customer">
                                        @if(count($customers) > 0)
                                        <option selected disabled>Choose an option</option>
                                            @foreach($customers as $customer)
                                                <option value="{{ $customer->id }}">{{ $customer->name }}</option>
                                            @endforeach
                                        @endif
                                    </select>
                                </div>    
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="product">Choose a service:<b class="text-danger">*</b></label>
                                    <select class="form-control" id="product" name="service">
                                        @if(count($products) > 0)
                                        <option selected disabled>Choose an option</option>
                                            @foreach($products as $product)
                                                <option value="{{ $product->slug }}">{{ $product->name }}</option>
                                            @endforeach
                                        @endif
                                    </select>
                                </div>    
                            </div>
                            <div class="col-md-2">
                                <div class="form-group">
                                    <label for="custom_price_option">Custom price:<b class="text-danger">*</b></label>
                                    <select class="form-control custom_price_option" name="custom_price_option" id="custom_price_option">
                                        <option selected disabled>Choose?</option>    
                                        <option value="yes">Yes</option>
                                        <option value="no">No</option>
                                    </select>
                                </div>    
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label for="price">Price:</label>
                                    <input type="number" class="form-control" name="price" id="price" placeholder="0.00" disabled>
                                </div>    
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="currency">Currency:</label>
                                    <select class="form-control" id="currency" name="currency">
                                        @if(count($currencies) > 0)
                                            <option selected disabled>Choose an option</option>
                                            @foreach($currencies as $currency)
                                                <option value="{{ $currency->code }}">{{ $currency->name }}</option>
                                            @endforeach
                                        @endif
                                    </select>   
                                </div>    
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="interval">Recurring:</label>
                                    <select class="form-control" id="interval" name="recurring">
                                        <option value="day">Daily</option>
                                        <option value="week">Weekly</option>
                                        <option value="month" selected>Monthly</option>
                                        <option value="three_of_month">Every 3 months</option>
                                        <option value="semiannual">Every 6 months</option>
                                        <option value="year">Yearly</option>
                                    </select>
                                </div>    
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="card">
                                    <div class="card-header d-flex justify-content-center">
                                            <label for="card-element">Please enter your card information</label>
                                    </div>
                                    <div class="card-body" id="credit-card">
                                            <div id="card-element">
                                            <!-- A Stripe Element will be inserted here. -->
                                            </div>
                                            <!-- Used to display form errors. -->
                                            <div id="card-errors" role="alert"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="card-footer d-flex justify-content-end">
                        <button id="card-button" class="btn btn-secondary" type="submit" data-secret=""> 
                            Create 
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
@endsection
<script src="https://js.stripe.com/v3/"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<script>
    // Custom styling can be passed to options when creating an Element.
    // (Note that this demo uses a wider set of styles than the guide below.)
    var style = {
        base: {
            color: '#32325d',
            class: 'form-group form-control',
            lineHeight: '30px',
            fontFamily: '"Helvetica Neue", Helvetica, sans-serif',
            fontSmoothing: 'antialiased',
            fontSize: '20px',
            '::placeholder': {
                color: '#aab7c4'
            }
        },
        invalid: {
            color: '#fa755a',
            iconColor: '#fa755a'
        }
    };
    
    $(document).ready(function () {
        $('#mode').on('change', function() {
            $('#customer').val('Choose an option');    
        });
        
        $('#customer').on('change', function() {
            
            if($('#mode').val() == "offline") {
                $('#credit-card').fadeOut('slow');
                return false;
            }
            $('#credit-card').fadeIn('slow');

            $.ajax({
                url: "{{ url('subscription/setCustomerIntent') }}",
                type: "get",
                data: {
                    cid: $(this).val()
                },
                success:function(resp) {
                    console.log(resp);
                    if(resp.status) {
                        console.log(resp.intent)
                        // $('#secret').val(resp.intent.client_secret);
                        $('#card-button').attr({ 'data-secret': resp.intent });
                        const stripe = Stripe('{{ env("STRIPE_KEY") }}', { locale: 'en' });
                        const elements = stripe.elements();
                        const cardElement = elements.create('card', { style: style });
                        // console.log(cardElement.mount('#card-element'));
                        const cardButton = $('#card-button').attr('data-secret');
                        const clientSecret = cardButton;
                        // const clientSecret = $('#secret').val();
                        // console.log(clientSecret);
                        cardElement.mount('#card-element');

                        // Handle real-time validation errors from the card Element.
                        cardElement.addEventListener('change', function(event) {
                            var displayError = document.getElementById('card-errors');
                            if (event.error) {
                                displayError.textContent = event.error.message;
                            } else {
                                displayError.textContent = '';
                            }
                        });

                        // Handle form submission.
                        var form = document.getElementById('payment-form');

                        form.addEventListener('submit', function(event) {
                            event.preventDefault();

                            stripe
                                .handleCardSetup(clientSecret, cardElement, {
                                    payment_method_data: {
                                        //billing_details: { name: cardHolderName.value }
                                    }
                                })
                                .then(function(result) {
                                    console.log(result+ 'asd');
                                    if (result.error) {
                                        // Inform the user if there was an error.
                                        var errorElement = document.getElementById('card-errors');
                                        errorElement.textContent = result.error.message;
                                    } else {
                                        console.log(result+ 'aasasdasd');
                                        // Send the token to your server.
                                        stripeTokenHandler(result.setupIntent.payment_method);
                                    }
                                });
                        });

                        // Submit the form with the token ID.
                        function stripeTokenHandler(paymentMethod) {
                            // Insert the token ID into the form so it gets submitted to the server
                            var form = document.getElementById('payment-form');
                            var hiddenInput = document.createElement('input');
                            hiddenInput.setAttribute('type', 'hidden');
                            hiddenInput.setAttribute('name', 'paymentMethod');
                            hiddenInput.setAttribute('value', paymentMethod);
                            form.appendChild(hiddenInput);

                            // Submit the form
                            form.submit();
                        }
                    }
                }
            });
        });
        $('.custom_price_option').on('change', function() {
            if($(this).val() == "yes") {
                $('#price').removeAttr('disabled');
                alert('Custom price will be use now.');
                return false;
            }
            $('#price').attr('disabled', true);
            alert('Actual price will be use now.');
        });
    });
</script>