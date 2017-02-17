var DT = $('#clients').DataTable({
    serverSide: true,
    processing: true,
    "aaSorting": [[ 0, 'desc' ]],
    ajax: 'load-all-clients',
    columns: [
        { data: 'id', name: 'id'},
        { data: 'full_name', name: 'full_name'},
        { data: 'phone_number', name: 'phone_number'},
        { data: 'client_group', name: 'client_group'},
        { data: 'status', name: 'status'}
    ]
});