// var DT = $('#client-sms').DataTable({
//     serverSide: true,
//     processing: true,
//     "aaSorting": [[ 0, 'desc' ]],
//     ajax: 'load-clients-sms-bundle',
//     columns: [
//         { data: 'id', name: 'id'},
//         { data: 'mf_id', name: 'mf_id'},
//         { data: 'remaining_sms', name: 'remaining_sms'},
//         { data: 'purchase_sms', name: 'id'}
//     ]
// });

$('.purchase-sms-btn').on('click',function () {
   var id = $(this).attr('purchase-id');
   $('#credit-id').val(id);
});