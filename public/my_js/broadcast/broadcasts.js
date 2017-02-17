var DT = $('#broadcasts').DataTable({
    serverSide: true,
    processing: true,
    "aaSorting": [[ 0, 'desc' ]],
    ajax: 'load-broadcasts',
    columns: [
        { data: 'id', name: 'id'},
        { data: 'recipients', name: 'recipients'},
        { data: 'message_body', name: 'message_body'},
        { data: 'client_group', name: 'client_group'},
        { data: 'recipient_count', name: 'recipient_count'}
    ]
});