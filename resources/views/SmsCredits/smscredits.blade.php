@extends('layouts.dt')
@section('title', 'Sms Credits')
@section('widget-title', 'Manage Credits')
@section('widget-desc', 'Clients Sms Credits')

@section('content')
    @include('layouts.includes._messages')
    <table id="datatables-tools" class="table table-striped table-bordered table-hover" width="100%">
        <thead>
        <tr>
            <th>ID</th>
            <th>Client Name</th>
            <th>Credits Remaining</th>
            <th>Purchase Sms</th>

        </tr>
        </thead>
        <tbody>
        @if(count($credits))
            @foreach($credits as $credit)
                <?php $client = App\Masterfile::find($credit->mf_id) ?>
                <tr>
                    <td>{{ $credit->id }}</td>
                    <td>{{ (!empty($client))? $client->surname.' '.$client->firstname.' '.$client->middlename : '' }}</td>
                    <td>{{ $credit->remaining_sms}}</td>
                    <td><a href="#purchase-sms" data-toggle="modal" purchase-id="{{ $credit->id }}" class="btn btn-success btn-sm purchase-sms-btn"><i class="fa fa-money"></i>  Purchase sms</a> </td>
                </tr>
                @endforeach
            @endif
        </tbody>
    </table>
@endsection

@section('modals')
    <div class="modal fade" id="purchase-sms" role="dialog" >
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;
                    </button>
                    <h4 class="modal-title">
                        Purchase sms
                    </h4>
                </div>
                <div class="modal-body no-padding">

                    <form id="add-menu-form" class="smart-form" action="{{ url('purchase-sms-client') }}" method="post">
                        {{ csrf_field() }}
                        <fieldset>
                            <section>
                                <div class="row">
                                    <label class="label col col-2">Quantity</label>
                                    <div class="col col-10">
                                        <label class="input"> <i class="icon-append fa fa-keyboard-o"></i>
                                            <input type="number"  name="sms_quantity" required autocomplete="off">
                                        </label>
                                    </div>
                                </div>
                            </section>

                        <input type="hidden" name="credit_id" id="credit-id">
                        </fieldset>

                        <footer>
                            <button type="submit" class="btn btn-primary">
                                <i class="fa fa-save"></i> Save
                            </button>
                            <button type="button" class="btn btn-default" data-dismiss="modal">
                                <i class="fa fa-remove"></i> Cancel
                            </button>

                        </footer>
                    </form>


                </div>

            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div>

@endsection

@push('js')
<script src="{{ URL::asset('my_js/sms/client_sms.js') }}"></script>
@endpush