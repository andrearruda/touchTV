$(function(){
    $('.datepicker').datepicker({
        language: "pt-BR",
        autoclose: true,
        todayHighlight: true,
        startView: 1,
        minViewMode: 1,
        maxViewMode: 1,
        format: "mm",
    });

    $('.modal-footer .bt_submit_form').click(function(){
        $('[name=form_employee_import]').submit();
    });
});