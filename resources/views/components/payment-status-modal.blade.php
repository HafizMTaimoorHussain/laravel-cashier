<div class="modal fade" id="payment-status" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Change payment status</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <form id="payment-status-form" action="{{ route('subscription.update-payment-status') }}" method="POST">
        @csrf
        <input type="hidden" name="hidden_subcsription_id" id="hidden_subcsription_id">
        <div class="modal-body">
            <div class="form-group">
                <label for="payment_status">Status</label>
                <select name="payment_status" id="payment_status" class="form-control">
                    <option selected disabled>Choose an option</option>
                    <option value="1">Paid</option>
                    <option value="2">Unpaid</option>
                </select>
            </div>
        </div>
        <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            <button type="submit" class="btn btn-secondary">Update</button>
        </div>
      </form>
    </div>
  </div>
</div>