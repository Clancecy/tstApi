var userurl = 'http://192.168.137.140:80';
var researchurl = 'http://192.168.137.140:8080/ES';


function defaultmems(aTd,task) {
    var names = new Array();
    for(index in task.taskUserList){
        names.push(task.taskUserList[index].userID);
    }
    return names;
}

function selectTask(aTd,taskList) {
    var task;
    for(index in taskList){
        if(taskList[index].taskID === parseInt(aTd[0].innerHTML)){
            task = taskList[index];
        }
    }
    return task;
}

function initUpload(staid) {
    $("#uploadimg").fileinput('destroy').fileinput({
        showCaption: false,
        showRemove: false,
        showUpload: false,
        uploadUrl: userurl + '/station/upload',
        uploadExtraData:{'staID': staid},
        enctype: 'multipart/form-data',
        language: 'zh',
        allowedFileExtensions: ['jpg', 'gif', 'png'],
        browseClass: "btn btn-primary btn-block",
    });
}

function reNewStation(addressInfo) {
    $("#id").val(addressInfo.staID);
    $("#pid").val(addressInfo.pStaID);
    $("#name").val(addressInfo.staName);
    $("#address").val(addressInfo.address);
    $("#pname").val(addressInfo.pStaName);
    // $("#device").val(addressInfo.addressName);
    $("#lng").val(addressInfo.longitude);
    $("#lat").val(addressInfo.latitude);
    $("#tag").val(addressInfo.tagString);
    var html = '';
    for(i in addressInfo.fileList){
        html +=
        '<div class="col-xs-6 col-sm-4 col-md-3 col-lg-2 file-block">\n' +
        '                            <input class="fileid" type="hidden" value="'+addressInfo.fileList[i].fileID+'" />\n' +
        '                            <div class="col-xs-12 info-file">\n' +
        '                                        <a href="'+addressInfo.fileList[i].url+'" data-lightbox="image" data-title="'+addressInfo.fileList[i].remark+'">\n' +
        '                                            <img src="'+addressInfo.fileList[i].url+'" class="jqthumb" alt="image">\n' +
        '                                        </a>\n' +
        '                            </div>\n' +
        '                            <div class="col-xs-12 info-title">\n' +
        '                                '+addressInfo.fileList[i].fileName+'\n' +
        '                            </div>\n' +
        '                            <div class="col-xs-12 info-btn">\n' +
        '                                <a class="btn btn-danger">删除</a>\n' +
        '                            </div>\n' +
        '                        </div>';
    }
    $("#gallery").html(html);
    $("img").jqthumb({
        classname      : 'jqthumb',             // class name. DEFUALT IS jqthumb
        width          : '207px',                // new image width after cropping. DEFAULT IS 100px.
        height         : '44px',                // new image height after cropping. DEFAULT IS 100px.
        source         : 'src',
        zoom           : '1',//缩放比例
        method         : 'auto',
    });
}

function initUploadDev(devID) {
    $("#uploadlabel").fileinput('destroy').fileinput({
        showCaption: false,
        showRemove: false,
        showUpload: false,
        uploadUrl: userurl + '/device/plate',
        uploadExtraData:{'devID': devID},
        enctype: 'multipart/form-data',
        language: 'zh',
        allowedFileExtensions: ['jpg', 'gif', 'png'],
        browseClass: "btn btn-primary btn-block",
    });
    $("#uploaddevice").fileinput('destroy').fileinput({
        showCaption: false,
        showRemove: false,
        showUpload: false,
        uploadUrl: userurl + '/device/devPic',
        uploadExtraData:{'devID': devID},
        enctype: 'multipart/form-data',
        language: 'zh',
        allowedFileExtensions: ['jpg', 'gif', 'png'],
        browseClass: "btn btn-primary btn-block",
    });
    $("#uploadfile").fileinput('destroy').fileinput({
        showCaption: false,
        showRemove: false,
        showUpload: false,
        uploadUrl: userurl + '/device/upload',
        uploadExtraData:{'devID': devID},
        enctype: 'multipart/form-data',
        language: 'zh',
        browseClass: "btn btn-primary btn-block",
    });
}

function reNewDevice(devInfo, adselDevType) {
    adselDevType.setValue(devInfo.devTypeID);
    $("#id").val(devInfo.devID);
    $("#linenumber").val(devInfo.lineNumber);
    $("#name").val(devInfo.devName);
    $("#volt").val(devInfo.volStep);
    $("#runnumber").val(devInfo.runNumber);
    $("#outnumber").val(devInfo.initNumber);
    $("#manunumber").val(devInfo.modNumber);
    $("#indate").val(_getDate(devInfo.usetime));
    $("#manudate").val(_getDate(devInfo.buildtime));
    $("#plant").val(devInfo.factory);
    $("#state").val(devInfo.status);
    $("#tag").val(devInfo.tagString);
    $("#label").html('<a href="'+devInfo.plateUrl+'" data-lightbox="image" data-title="文字说明"><img src="'+devInfo.plateUrl+'" class="jqthumb1 devinfo" alt="image"></a>');
    $("#device").html('<a href="'+devInfo.devUrl+'" data-lightbox="image" data-title="文字说明"><img src="'+devInfo.devUrl+'" class="jqthumb1 devinfo" alt="image"></a>');
    var html = '';
    for(i in devInfo.fileList){
        console.log(userurl+'/device/download?devID='+devInfo.fileList[i].devID+'&fileID='+devInfo.fileList[i].fileID);
        html +=
            '<div class="col-xs-6 col-sm-4 col-md-3 col-lg-2 file-block">\n' +
            '                            <input class="fileid" type="hidden" value="'+devInfo.fileList[i].fileID+'" />\n' +
            '                            <div class="col-xs-12 info-file">\n' +
            '                                <img src="../images/file.jpg" class="jqthumb2 info-img" alt="image">\n' +
            '                            </div>\n' +
            '                            <div class="col-xs-12 info-title">\n' +
            '                                '+devInfo.fileList[i].fileName+'\n' +
            '                            </div>\n' +
            '                            <div class="col-xs-12 info-btn">\n' +
            '                                <a href="'+userurl+'/device/download?devID='+devInfo.fileList[i].devID+'&fileID='+devInfo.fileList[i].fileID+'" download="'+devInfo.fileList[i].fileName+'" class="btn btn-primary">下载</a>\n' +
            '                                <a class="btn btn-danger" style="float: right;">删除</a>\n' +
            '                            </div>\n' +
            '                        </div>';
    }
    $("#file-body").html(html);
    $(".devinfo").jqthumb({
        classname      : 'jqthumb1',             // class name. DEFUALT IS jqthumb
        width          : '174px',                // new image width after cropping. DEFAULT IS 100px.
        height         : '174px',               // new image height after cropping. DEFAULT IS 100px.
        source         : 'src',
        zoom           : '1',//缩放比例
        method         : 'auto',
    });
    $(".info-img").jqthumb({
        classname      : 'jqthumb2',             // class name. DEFUALT IS jqthumb
        width          : $(".info-file").width()+'px',                // new image width after cropping. DEFAULT IS 100px.
        height         : $(".info-file").width()+'px',               // new image height after cropping. DEFAULT IS 100px.
        source         : 'src',
        zoom           : '1',//缩放比例
        method         : 'auto',
    });

}

function initUploadIns(insID) {
    $("#uploadlabel").fileinput('destroy').fileinput({
        showCaption: false,
        showRemove: false,
        showUpload: false,
        uploadUrl: userurl + '/instrument/plate',
        uploadExtraData:{'insID': insID},
        enctype: 'multipart/form-data',
        language: 'zh',
        allowedFileExtensions: ['jpg', 'gif', 'png'],
        browseClass: "btn btn-primary btn-block",
    });
    $("#uploaddevice").fileinput('destroy').fileinput({
        showCaption: false,
        showRemove: false,
        showUpload: false,
        uploadUrl: userurl + '/instrument/insPic',
        uploadExtraData:{'insID': insID},
        enctype: 'multipart/form-data',
        language: 'zh',
        allowedFileExtensions: ['jpg', 'gif', 'png'],
        browseClass: "btn btn-primary btn-block",
    });
    $("#uploadfile").fileinput('destroy').fileinput({
        showCaption: false,
        showRemove: false,
        showUpload: false,
        uploadUrl: userurl + '/instrument/upload',
        uploadExtraData:{'insID': insID},
        enctype: 'multipart/form-data',
        language: 'zh',
        browseClass: "btn btn-primary btn-block",
    });
}

function reNewInstrument(insInfo) {
    $("#id").val(insInfo.insID);
    $("#name").val(insInfo.insName);
    $("#instype").val(insInfo.modNumber);
    $("#plant").val(insInfo.factory);
    $("#number1").val(insInfo.insNumber);
    $("#number2").val(insInfo.initNumber);
    $("#indate").val(_getDate(insInfo.usetime));
    $("#outdate").val(_getDate(insInfo.inittime));
    $("#state").val(insInfo.status);
    $("#enddate").val(_getDate(insInfo.valtime));
    $("#addition").val(insInfo.remark);
    $("#label").html('<a href="'+insInfo.plateUrl+'" data-lightbox="image" data-title="文字说明"><img src="'+insInfo.plateUrl+'" class="jqthumb1 insinfo" alt="image"></a>');
    $("#device").html('<a href="'+insInfo.insUrl+'" data-lightbox="image" data-title="文字说明"><img src="'+insInfo.insUrl+'" class="jqthumb1 insinfo" alt="image"></a>');
    var html = '';
    for(i in insInfo.fileList){
        console.log(userurl+'/device/download?devID='+insInfo.fileList[i].insID+'&fileID='+insInfo.fileList[i].fileID);
        html +=
            '<div class="col-xs-6 col-sm-4 col-md-3 col-lg-2 file-block">\n' +
            '                            <input class="fileid" type="hidden" value="'+insInfo.fileList[i].fileID+'" />\n' +
            '                            <div class="col-xs-12 info-file">\n' +
            '                                <img src="../images/file.jpg" class="jqthumb2 info-img" alt="image">\n' +
            '                            </div>\n' +
            '                            <div class="col-xs-12 info-title">\n' +
            '                                '+insInfo.fileList[i].fileName+'\n' +
            '                            </div>\n' +
            '                            <div class="col-xs-12 info-btn">\n' +
            '                                <a href="'+userurl+'/instrument/download?insID='+insInfo.fileList[i].insID+'&fileID='+insInfo.fileList[i].fileID+'" download="'+insInfo.fileList[i].fileName+'" class="btn btn-primary">下载</a>\n' +
            '                                <a class="btn btn-danger" style="float: right;">删除</a>\n' +
            '                            </div>\n' +
            '                        </div>';
    }
    $("#file-body").html(html);
    $(".insinfo").jqthumb({
        classname      : 'jqthumb1',             // class name. DEFUALT IS jqthumb
        width          : '174px',                // new image width after cropping. DEFAULT IS 100px.
        height         : '174px',               // new image height after cropping. DEFAULT IS 100px.
        source         : 'src',
        zoom           : '1',//缩放比例
        method         : 'auto',
    });
    $(".info-img").jqthumb({
        classname      : 'jqthumb2',             // class name. DEFUALT IS jqthumb
        width          : $(".info-file").width()+'px',                // new image width after cropping. DEFAULT IS 100px.
        height         : $(".info-file").width()+'px',               // new image height after cropping. DEFAULT IS 100px.
        source         : 'src',
        zoom           : '1',//缩放比例
        method         : 'auto',
    });
}

function searchUser(userList,html) {
    for(i in userList){
        if(userList[i].tagID){
            html +=
                '                                <li>\n' +
                '                                    <a tag-id="'+userList[i].tagID+'" class="has-arrow" href="#" aria-expanded="false">'+userList[i].tagName+'</a>\n' +
                '                                    <ul>\n';
            html += searchUser(userList[i].children,'');
            html +=
                '                                    </ul>\n' +
                '                                </li>\n';
        }else{
            html += '<li><a user-id="'+userList[i].userID+'" href="#">'+userList[i].userRealName+'</a></li>\n';
        }
    }
    return html;
}

function resetUser(userList) {
    for(i in userList){
        if(userList[i].tagID && userList[i].children){
            resetUser(userList[i].children);
        }else if(!userList[i].tagID){
            userList[i].tagID = userList[i].userID;
            userList[i].tagName = userList[i].userRealName;
        }
    }
    return userList;
}

function renewTestTable(testTable,option) {
    var testList = getPlanTestList(option);
    for(i in testList){
        testList[i].addDate = _getDate(testList[i].addtime);
        if(testList[i].endtime){
            testList[i].endDate = _getDate(testList[i].endtime);
        }else{
            testList[i].endDate = '';
        }
        if(testList[i].status === 0){
            testList[i].staName = '进行中';
        }else if(testList[i].status === 1){
            testList[i].staName = '已完成';
        }else if(testList[i].status === 2){
            testList[i].staName = '审核中';
        }
        var testNames = '';
        for(index in testList[i].testUserList){
            testNames += testList[i].testUserList[index].userName;
            testNames += ',';
        }
        testNames = testNames.substr(0,testNames.length-1);
        testList[i].testNames = testNames;
    }
    console.log(testList);

    testTable.clear().draw();
    for(i in testList){
        testTable.row.add(testList[i]).draw();
    }
}

function renewTaskTable(taskTable,option) {
    var taskList = getTestTaskList(option);
    for(i in taskList){
        taskList[i].addDate = _getDate(taskList[i].addtime);
        if(taskList[i].endtime){
            taskList[i].endDate = _getDate(taskList[i].endtime);
        }else{
            taskList[i].endDate = '';
        }
        if(taskList[i].status === 0){
            taskList[i].staName = '进行中';
        }else if(taskList[i].status === 1){
            taskList[i].staName = '已完成';
        }else if(taskList[i].status === 2){
            taskList[i].staName = '审核中';
        }
        var taskNames = '';
        if(taskList[i].taskUserList === null){
            taskNames = '';
        }else{
            for(index in taskList[i].taskUserList){
                taskNames += taskList[i].taskUserList[index].userRealName;
                taskNames += ',';
            }
        }
        taskNames = taskNames.substr(0,taskNames.length-1);
        taskList[i].taskNames = taskNames;
    }
    console.log(taskList);

    taskTable.clear().draw();
    for(i in taskList){
        taskTable.row.add(taskList[i]).draw();
    }
}

function renewTaskList(taskTable) {
    var taskList = getTaskList();
    for(i in taskList){
        taskList[i].addDate = _getDate(taskList[i].addtime);
        if(taskList[i].endtime){
            taskList[i].endDate = _getDate(taskList[i].endtime);
        }else{
            taskList[i].endDate = '';
        }
        if(taskList[i].status === 0){
            taskList[i].staName = '进行中';
        }else if(taskList[i].status === 1){
            taskList[i].staName = '已完成';
        }else if(taskList[i].status === 2){
            taskList[i].staName = '审核中';
        }
        var taskNames = '';
        for(index in taskList[i].taskUserList){
            taskNames += taskList[i].taskUserList[index].userRealName;
            taskNames += ',';
        }
        taskNames = taskNames.substr(0,taskNames.length-1);
        taskList[i].taskNames = taskNames;
    }
    console.log(taskList);

    taskTable.clear().draw();
    for(i in taskList){
        taskTable.row.add(taskList[i]).draw();
    }
}

function getTaskUserIDs(taskUserList) {
    var userIDs = new Array();
    for(i in taskUserList){
        userIDs.push(taskUserList[i].userID);
    }
    return userIDs;
}

function reNewPlanTableByStatus(planTable,planList) {
    planTable.clear().draw();
    for (i in planList) {
        if(planList[i].status === 0){
            planTable.row.add(planList[i]).draw();
        }
    }
}

function reCoverPlanTableByStatus(planTable,planList) {
    planTable.clear().draw();
    for (i in planList) {
        planTable.row.add(planList[i]).draw();
    }
}

function reNewTestTableByStatus(testTable,testList) {
    testTable.clear().draw();
    for (i in testList) {
        if(testList[i].status === 0){
            testTable.row.add(testList[i]).draw();
        }
    }
}

function reCoverTestTableByStatus(testTable,testList) {
    testTable.clear().draw();
    for (i in testList) {
        testTable.row.add(testList[i]).draw();
    }
}

function reNewTaskTableByStatus(taskTable,taskList) {
    taskTable.clear().draw();
    for (i in taskList) {
        if(taskList[i].status === 0){
            taskTable.row.add(taskList[i]).draw();
        }
    }
}

function reCoverTaskTableByStatus(taskTable,taskList) {
    taskTable.clear().draw();
    for (i in taskList) {
        taskTable.row.add(taskList[i]).draw();
    }
}

function getDataItems(itemID,itemList){
    var item;
    for(i in itemList){
        if(itemList[i].children != null){
            var trueItem = getDataItems(itemID,itemList[i].children);
            if(trueItem){
                item = trueItem;
            }
        }else{
            if(parseInt(itemID) === parseInt(itemList[i].itemID)){
                item = itemList[i];
            }
        }
    }
    return item;
}

function getDataDevType(typeID,devTypeList) {
    var name;
    for(i in devTypeList){
        if(devTypeList[i].children != null){
               var trueName = getDataDevType(typeID,devTypeList[i].children);
               if(trueName){
                   name = trueName;
               }
        }else{
            if(parseInt(typeID) === parseInt(devTypeList[i].typeID)){
                name = devTypeList[i].typeName;
            }
        }
    }
    return name;
}

