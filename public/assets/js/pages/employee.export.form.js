$(function(){
    $('.datepicker').datepicker({
        language: "pt-BR",
        autoclose: true,
        todayHighlight: true,
        format: "dd/mm/yyyy",
    });

    $('.modal-footer .bt_submit_form').click(function(){
        $('[name=form_employee_export]').submit();
    });
});