@extends('layouts.sms-layout')


@section('content')
    <div class="inbox-nav-bar no-content-padding">

        <h1 class="page-title txt-color-blueDark hidden-tablet"><i class="fa fa-fw fa-inbox"></i> Messages &nbsp;
            {{--<span class="btn-group">--}}
							{{--<a href="#" data-toggle="dropdown" class="btn btn-default btn-xs dropdown-toggle"><span class="caret single"></span></a>--}}
							{{--<ul class="dropdown-menu">--}}
								{{--<li>--}}
									{{--<a href="#">Action</a>--}}
								{{--</li>--}}
								{{--<li>--}}
									{{--<a href="#">Another action</a>--}}
								{{--</li>--}}
								{{--<li>--}}
									{{--<a href="#">Something else here</a>--}}
								{{--</li>--}}
								{{--<li class="divider"></li>--}}
								{{--<li>--}}
									{{--<a href="#">Separated link</a>--}}
								{{--</li>--}}
							{{--</ul>--}}
						{{--</span>--}}
        </h1>

        <div class="btn-group hidden-desktop visible-tablet">
            <button class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                Messages <i class="fa fa-caret-down"></i>
            </button>
            <ul class="dropdown-menu pull-left">
                {{--<li>--}}
                    {{--<a href="javascript:void(0);" class="inbox-load">Inbox <i class="fa fa-check"></i></a>--}}
                {{--</li>--}}
                <li>
                    <a href="javascript:void(0);" class="inbox-load">Sent <i class="fa fa-check"></i></a>
                </li>
                {{--<li>--}}
                    {{--<a href="javascript:void(0);">Trash</a>--}}
                {{--</li>--}}
                {{--<li class="divider"></li>--}}
                {{--<li>--}}
                    {{--<a href="javascript:void(0);">Spam</a>--}}
                {{--</li>--}}
            </ul>

        </div>

        <div class="inbox-checkbox-triggered">

            <div class="btn-group">
                {{--<a href="javascript:void(0);" rel="tooltip" title="" data-placement="bottom" data-original-title="Mark Important" class="btn btn-default"><strong><i class="fa fa-exclamation fa-lg text-danger"></i></strong></a>--}}
                {{--<a href="javascript:void(0);" rel="tooltip" title="" data-placement="bottom" data-original-title="Move to folder" class="btn btn-default"><strong><i class="fa fa-folder-open fa-lg"></i></strong></a>--}}
                {{--<a href="javascript:void(0);" rel="tooltip" title="" data-placement="bottom" data-original-title="Delete" class="deletebutton btn btn-default"><strong><i class="fa fa-trash-o fa-lg"></i></strong></a>--}}
            </div>

        </div>

        <a href="javascript:void(0);" id="compose-mail-mini" class="btn btn-primary hidden-desktop visible-tablet"> <strong><i class="fa fa-mail-forward fa-lg"></i></strong> Send Message </a>
        {{--<a href="javascript:void(0);" id="compose-mail" class="btn btn-primary btn-block"> <strong>Compose</strong> </a>--}}

        <div class="btn-group pull-right inbox-paging">
            {{--<a href="javascript:void(0);" class="btn btn-default btn-sm"><strong><i class="fa fa-chevron-left"></i></strong></a>--}}
            {{--<a href="javascript:void(0);" class="btn btn-default btn-sm"><strong><i class="fa fa-chevron-right"></i></strong></a>--}}
            <?php $sms = \App\SmsCredit::where('mf_id',\Illuminate\Support\Facades\Auth::user()->mf_id)->get();
            if(count($sms)){
            foreach ($sms as $s){
            ?>
            <strong><?php echo $s->remaining_sms?></strong> Credits Remaining
            <?php
            }}
            ?>
        </div>

    </div>
    @include('layouts.includes._messages')
    <div id="inbox-content" class="inbox-body no-content-padding">

        <div class="inbox-side-bar">

            <a href="javascript:void(0);" id="compose-mail" class="btn btn-primary btn-block"> <strong>Compose</strong> </a>

            <h6> Folder <a href="javascript:void(0);" rel="tooltip" title="" data-placement="right" data-original-title="Refresh" class="pull-right txt-color-darken"><i class="fa fa-refresh fa-spin"></i></a></h6>

            <ul class="inbox-menu-lg">
                <li class="active">
                    <a class="inbox-load" href="javascript:void(0);"> Sent Messages </a>
                </li>
                {{--<li>--}}
                    {{--<a href="javascript:void(0);">Sent</a>--}}
                {{--</li>--}}
                {{--<li>--}}
                    {{--<a href="javascript:void(0);">Draft</a>--}}
                {{--</li>--}}
                {{--<li>--}}
                    {{--<a href="javascript:void(0);">Trash</a>--}}
                {{--</li>--}}
            </ul>

            {{--<h6> Quick Access <a href="javascript:void(0);" rel="tooltip" title="" data-placement="right" data-original-title="Add Another" class="pull-right txt-color-darken"><i class="fa fa-plus"></i></a></h6>--}}

            {{--<ul class="inbox-menu-sm">--}}
                {{--<li>--}}
                    {{--<a href="javascript:void(0);"> Images (476)</a>--}}
                {{--</li>--}}
                {{--<li>--}}
                    {{--<a href="javascript:void(0);">Documents (4)</a>--}}
                {{--</li>--}}
            {{--</ul>--}}

            <div class="air air-bottom inbox-space">


            </div>

        </div>

        <div class="table-wrap custom-scroll animated slow fadeInRight">
            <!-- ajax will fill this area -->
            LOADING...

        </div>

        <div class="inbox-footer">

            <div class="row">

                <div class="col-xs-6 col-sm-1">

                    <div class="txt-color-white hidden-desktop visible-mobile">
                        {{--3.5GB of <strong>10GB</strong>--}}

                        <div class="progress progress-micro">
                            <div class="progress-bar progress-primary" style="width: 34%;"></div>
                        </div>
                    </div>
                </div>

                <div class="col-xs-6 col-sm-11 text-right">
                    <div class="txt-color-white inline-block">
                        <i class="txt-color-blueLight hidden-mobile">Last account activity <i class="fa fa-clock-o"></i> 52 mins ago |</i> Displaying <strong>44 of 259</strong>
                    </div>
                </div>

            </div>

        </div>

    </div>

    @endsection