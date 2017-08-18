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
        loadURL("ajax/email/email-list.html", $('#inbox-content > .table-wrap'))


    }, 1000); // how long do you want the delay to be?
});