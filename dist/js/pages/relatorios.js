$(function () {
    $(".loading-bg").css("display", "none");
    $('.Tabelas').DataTable({
        "searching": false,
        rowReorder: {
            selector: 'td:nth-child(2)'
        },
        responsive: true
    });
});