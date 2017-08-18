/**
 * Created by Alx on 2/21/2017.
 */
var DT = $('#client-groups').DataTable({
    serverSide: true,
    processing: true,
    "aaSorting": [[ 0, 'desc' ]],
    ajax: 'load-all-client-groups',
    columns: [
        { data: 'id', name: 'id'},
        { data: 'group_name', name: 'group_name'},
        { data: 'status', name: 'status'},
        { data: 'id', name: 'id'},
        { data: 'id', name: 'id'}
    ]
});