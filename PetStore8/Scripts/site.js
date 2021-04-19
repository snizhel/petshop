var timer = null;
//type:alert-info, alert-warning, alert-success, alert-danger
function alert_show(type, title, content) {
    $("#alert").removeClass().addClass("alert " + type);
    $("#alert-title").html(title);
    $("#alert-content").html(content);
    timer = setTimeout(function () {
        alert_hide();
    }, 10000);
}
function alert_hide() {
    clearTimeout(timer);
    $("#alert").addClass("hidden");
}