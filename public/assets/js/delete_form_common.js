$(document).ready(function() {
    $('[data-toggle="tooltip"]').tooltip();

    $('.bt_modal_action_delete').click(function(){
        var bt = $(this);
        var url = $(this).attr('data-url');

        $.ajax({
            type: 'POST',
            url: url,
            dataType: 'text',
            success: function(data){
                $('#myModal').modal('toggle');
                location.reload();
            },
            beforeSend: function(){
                bt.attr('disabled', true);
            },
            complete: function(){
                bt.removeAttr('disabled');
            }
        });
    });
});