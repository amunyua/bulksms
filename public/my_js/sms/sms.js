var DT = $('#master_sms').DataTable({
    serverSide: true,
    processing: true,
    "aaSorting": [[ 0, 'desc' ]],
    ajax: 'load-sms-bundle',
    columns: [
        { data: 'id', name: 'id'},
        { data: 'bundle', name: 'bundle'}
    ]
});