<h2 class="email-open-header">
	Compose New Message
	<!--<span class="label txt-color-white">DRAFT</span>-->
	<!--<a href="javascript:void(0);" rel="tooltip" data-placement="left" data-original-title="Print" class="txt-color-darken pull-right"><i class="fa fa-print"></i></a>	-->
</h2>
<br>
<br>
<div class="">
<form action="{{ url('process-broadcast') }}" method="POST" class="form-horizontal" id="email-compose-form">
	{{ csrf_field() }}

	<div class="inbox-info-bar no-padding" id="recipient-group-option">
		<div class="row">
			<div class="form-group">
				<label class="control-label col-md-2"><strong>Recipients</strong></label>
				<div class="col-md-10">
					<select style="width:100%" class="form-control select2" id="cg" name="client_group" required>
						<option value="">Choose Recipient type</option>
						<option value="individuals">Individuals</option>
						<option value="client-groups">Contact Group(s)</option>
					</select>
					{{--<em><a href="javascript:void(0);" class="show-next" rel="tooltip" data-placement="bottom" data-original-title="Carbon Copy">CC</a></em>--}}
				</div>
			</div>
			<br>
		</div>
	</div>


	<div class="inbox-info-bar no-padding" id="group-recipients" style="display: none">
		<div class="row">
			<div class="form-group">
				<label class="control-label col-md-2"><strong>Contact Group(s)</strong></label>
				<div class="col-md-10">
					<select multiple  class="select2 form-control" name="group_recipients[]" required>
						{{--<option value="All">Send to all</option>--}}
						@if(count($client_groups))
							@foreach($client_groups as $client_group)
								<option value="{{$client_group->id}}">{{$client_group->group_name}}</option>
								@endforeach
							@endif

					</select>
					{{--<em><a href="javascript:void(0);" class="show-next" rel="tooltip" data-placement="bottom" data-original-title="Carbon Copy">CC</a></em>--}}
				</div>
			</div>
		</div>
	</div>
	<div class="inbox-info-bar no-padding" id="individual-recipients" style="display: none">
		<div class="row">
			<div class="form-group">
				<label class="control-label col-md-2"><strong>Choose Recipients</strong></label>
				<div class="col-md-10">
					<select multiple  class="select2 form-control" name="individual_recipients[]" required>
						{{--<option value="">Select</option>--}}
						@if(count($individuals))
							@foreach($individuals as $individual)
								<option value="{{$individual->id}}">{{$individual->full_name}}</option>
							@endforeach
						@endif

					</select>
					{{--<em><a href="javascript:void(0);" class="show-next" rel="tooltip" data-placement="bottom" data-original-title="Carbon Copy">CC</a></em>--}}
				</div>
			</div>
		</div>
	</div>
	<div class="chat-footer">

		<!-- CHAT TEXTAREA -->
		<div class="textarea-div">

			<div class="typearea">
				<textarea placeholder="Write your message..." id="textarea-expand" name="message_body" class="custom-scroll"></textarea>
			</div>

		</div>

		<!-- CHAT REPLY/SEND -->
		<span class="textarea-controls">
		</span>
	</div>
	
	<div class="inbox-compose-footer">

	<button class="btn btn-danger inbox-load" href="javascript:void(0);" type="button">
		Cancel
	</button>


	<button data-loading-text="&lt;i class='fa fa-refresh fa-spin'&gt;&lt;/i&gt; &nbsp; Sending..." class="btn btn-primary pull-right" type="submit" id="send">
		Send <i class="fa fa-arrow-circle-right fa-lg"></i>
	</button>


	</div>

</form>
</div>
<script type="text/javascript">
	
	// DO NOT REMOVE : GLOBAL FUNCTIONS!

	runAllForms();

	 // PAGE RELATED SCRIPTS

	$(".table-wrap [rel=tooltip]").tooltip();



    $('#emailbody').summernote({
        height: 250,
        focus: false,
        tabsize: 2
    });
    $('body').find('.note-toolbar,.panel-heading').hide();

	$(".show-next").click(function () {
	    $this = $(this);
	    $this.hide();
	    $this.parent().parent().parent().parent().parent().next().removeClass("hidden");
	})

    $("#send").on('click',function (e) {
        e.preventDefault();

        var $btn = $(this);
        $btn.button('loading');

//	    var data = $('#emailbody').val();
//	    alert(data);
//			return false;


        // wait for animation to finish and execute send script
        setTimeout(function () {
            //Insert send script here


            // Load inbox once send is complete
            $('#email-compose-form').submit().on('submit',function () {
                alert('submiting');
            });
//            loadURL("message-list", $('#inbox-content > .table-wrap'))


        }, 1000); // how long do you want the delay to be?
    });

	$('#recipient-group-option').on('change',function () {
		var g = $('#cg').val();
		if(g == 'individuals'){
		    $('#individual-recipients').show('slow');
		    $('#group-recipients').hide('slow');
		}else if(g == 'client-groups'){
            $('#individual-recipients').hide('slow');
            $('#group-recipients').show('slow');
		}else{
            $('#individual-recipients').hide('slow');
            $('#group-recipients').hide('slow');
		}
    });
	
</script>
