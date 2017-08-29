$(function(){
    $('.range').datepicker({
        inputs: $('.range-start, .range-end'),
        language: "pt-BR",
        todayHighlight: true,
        format: "yyyy-mm-dd"
    });
});