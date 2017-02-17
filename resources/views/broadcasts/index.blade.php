@extends('layouts.dt')
@section('title', 'Broadcasts')
@section('widget-title', 'Manage Broadcasts')
@section('widget-desc', 'Broadcasts')

@section('button')

    <ul class="list-inline list-unstyled pull-right">
        <li>
            <a type="button" class="btn btn-primary pull-right header-btn " data-toggle="modal" data-target="#add-user-role">
                <i class="fa fa-plus"></i> Send Broadcast

            </a>
        </li>
        {{--<li>--}}
        {{--<a data-toggle="modal" href="#edit-route" id="edit-masterfile-btn" class="btn btn-warning btn-sm header-btn  pull-right ">--}}
        {{--<i class="fa fa-edit"></i> Edit Supplier--}}
        {{--</a>--}}
        {{--</li>--}}
        {{--<li>--}}
        {{--<a data-toggle="modal" href="#delete-supplier" id="edit-route-btn" class="btn btn-danger btn-sm header-btn pull-right ">--}}
        {{--<i class="fa fa-edit"></i> Delete supplier--}}
        {{--</a>--}}
        {{--</li>--}}
    </ul>
@endsection

@section('content')
    @include('layouts.includes._messages')
    <table id="broadcasts" class="table table-striped table-bordered table-hover" width="100%">
        <thead>
        <tr>
            <th>ID</th>
            <th>Recipients</th>
            <th>Message</th>
            <th>Client Group</th>
            <th>Number of Recipients</th>

        </tr>
        </thead>
        <tbody>
        </tbody>
    </table>
@endsection

@section('modals')
    <div class="modal fade" id="add-user-role" role="dialog" >
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;
                    </button>
                    <h4 class="modal-title">
                        Purchase Sms
                    </h4>
                </div>
                <div class="modal-body no-padding">

                    <form id="add-menu-form" class="smart-form" action="{{ url('update-master-sms') }}" method="post">
                        {{ csrf_field() }}
                        <fieldset>
                            <section>
                                <div class="row">
                                    <label class="label col col-2">Send To</label>
                                    <div class="col col-10">
                                       <select name="client_group" class="form-control select2">
                                           <option value=""> -- Select recipients --</option>
                                       </select>
                                    </div>
                                </div>
                            </section>
                            <section>
                                <div class="row">
                                    <label class="label col col-2">Quantity</label>
                                    <div class="col col-10">
                                        <label class="input"> <i class="icon-append fa fa-keyboard-o"></i>
                                            <input type="number"  name="number_of_sms" autocomplete="off">
                                        </label>
                                    </div>
                                </div>
                            </section>
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
<script src="{{ URL::asset('my_js/broadcast/broadcasts.js') }}"></script>
@endpush