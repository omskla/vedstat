function test(){
    alert($("#83p"));
}

function clearFieldById(id){
    document.getElementById(id).value = "";
}
function showSpinner(idAfter) {
    var td = document.getElementById(idAfter);
    var imagePath = appContext + '/images/spinner.gif'
    var img = $('<img id="dynamic">');
    img.attr('src',imagePath);
    $("#"+idAfter).html(img);
}

function checkYear() {
    var year = $('#year');
    if (year.val() == "") {
        alert("Заполните отчетную дату!");
        return false;
    }
}

function updateTd(data,idTd) {
    var td = document.getElementById(idTd);
    td.innerHTML = data.itog;
}

function updateTdWithController(data,idTd,path) {
    $.each(data, function (key, value) {
        var td = document.getElementById(idTd);
        if(data.action!=undefined) {
                td.innerHTML = path;
        }
        else
            td.innerHTML = data.itog;
    });
}

//
//jQuery.fn.extend({
//    disableSelection : function() {
//        this.each(function() {
//            this.onselectstart = function() { return false; };
//            this.unselectable = "on";
//            jQuery(this).css({
//                '-moz-user-select': 'none'
//                ,'-o-user-select': 'none'
//                ,'-khtml-user-select': 'none'
//                ,'-webkit-user-select': 'none'
//                ,'-ms-user-select': 'none'
//                ,'user-select': 'none'
//            });
//            // Для Opera
//            jQuery(this).bind('mousedown', function() {
//                return false;
//            });
//        });
//    }
//});