function ajaxMethod(sendUrl,sendData,func) {
    $.ajax({
        type: "post",
        url: sendUrl,
        data: sendData,
        dataType:"text",
        success: func,
    });
}
function getDialog(dialogdiv,title,confun,canfun) {
    $(dialogdiv).dialog({
        modal:true,
        autoOpen:false,
        width:400,
        height:450,
        title: title,
        position: {my: "", at: "center", of: window.parent.document },
        hide: { effect: "clip", duration:10 },
        show: { effect: "shake", duration: 1000 },
        maxWidth:600,
        minWidth:270,
        minHeight:370,
        buttons: [
            {
                text: "确定",
                icon: "ui-icon-check",
                click: confun
            },
            {
                text: "取消",
                icon: "ui-icon-closethick",
                click: canfun
            }
        ]
    });
}
function getMyDialog(dialogdiv,title,width,height,ofNode,confun,canfun) {
    $(dialogdiv).dialog({
        modal:true,
        autoOpen:false,
        width:width,
        height:height,
        title: title,
        resizable: false,
        position: {my: "", at: "center", of: ofNode},
        hide: { effect: "clip", duration: 100 },
        show: { effect: "shake", duration: 1000 },
        maxWidth:600,
        minWidth:270,
        minHeight:370,
        buttons: [
            {
                text: "确定",
                icon: "ui-icon-check",
                click: confun
            },
            {
                text: "取消",
                icon: "ui-icon-closethick",
                click: canfun
            }
        ]
    });
}
function getFormat(){
    format = "";
    var nTime = new Date();
    format += nTime.getFullYear()+"-";
    format += (nTime.getMonth()+1)<10?"0"+(nTime.getMonth()+1):(nTime.getMonth()+1);
    format += "-";
    format += nTime.getDate()<10?"0"+(nTime.getDate()):(nTime.getDate());
    format += "T";
    format += nTime.getHours()<10?"0"+(nTime.getHours()):(nTime.getHours());
    format += ":";
    format += nTime.getMinutes()<10?"0"+(nTime.getMinutes()):(nTime.getMinutes());
    format += ":00";
    return format;
}
