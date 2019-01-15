var userurl = 'http://192.168.137.140:8080';
var researchurl = 'http://192.168.137.140/ES';

function getUrl() {
    var url = location.search; //获取url中"?"符后的字串
    var theRequest = new Object();
    if (url.indexOf("?") != -1) {
        var str = url.substr(1);
        strs = str.split("&");
        for (var i = 0; i < strs.length; i++) {
            theRequest[strs[i].split("=")[0]] = decodeURIComponent(strs[i].split("=")[1]);
        }
    }
    return theRequest;
}

function _getDate(time) {
    var now = new Date(time),
        y = now.getFullYear(),
        m = now.getMonth() + 1,
        d = now.getDate();
    return y + "-" + (m < 10 ? "0" + m : m) + "-" + (d < 10 ? "0" + d : d) + " " + now.toTimeString().substr(0, 5);
}

function getProList() {
    var list;
    $.ajax({
        type: 'GET',
        xhrFields: {
            withCredentials: true // 这里设置了withCredentials
        },
        crossDomain: true,
        url: researchurl+'/project/list',
        data: {},
        async:false,
        success:function (data) {
            var result = JSON.parse(data);
            if(result.code === 101){
                list= result.data;
            }else if(result.code === 5004){
                alert(result.message);
                window.location.href = '../admin-login-register/login.html'
            }else{
                alert(result.message);
            }
        }
    });
    return list;
}

function getProInfo(options) {
    var sheetList;
    $.ajax({
        type: 'GET',
        xhrFields: {
            withCredentials: true // 这里设置了withCredentials
        },
        crossDomain: true,
        url: researchurl+'/project/list',
        data: options,
        async:false,
        success: function (data) {
            var result = JSON.parse(data);
            // console.log(result.data);
            if(result.code === 101){
                sheetList = result.data;
            }else if(result.code === 5004){
                alert(result.message);
                window.location.href = '../admin-login-register/login.html'
            }else{
                alert(result.message);
            }
        },
        error: function(err) {
            console.error(err);
        }
    });
    return sheetList;
}

function getDevTypeList() {
    var list;
    $.ajax({
        type: 'GET',
        xhrFields: {
            withCredentials: true // 这里设置了withCredentials
        },
        crossDomain: true,
        url: researchurl+'/devType/list',
        data: {},
        async:false,
        success:function (data) {
            var result = JSON.parse(data);
            if(result.code === 101){
                list= result.data;
            }else if(result.code === 5004){
                alert(result.message);
                window.location.href = '../admin-login-register/login.html'
            }else{
                alert(result.message);
            }
        }
    });
    return list;
}

function getDevType(devTypeID) {
    var list;
    $.ajax({
        type: 'GET',
        xhrFields: {
            withCredentials: true // 这里设置了withCredentials
        },
        crossDomain: true,
        url: researchurl+'/devType/show',
        data: {
            'typeID': devTypeID
        },
        async:false,
        success:function (data) {
            var result = JSON.parse(data);
            if(result.code === 101){
                list= result.data;
            }else if(result.code === 5004){
                alert(result.message);
                window.location.href = '../admin-login-register/login.html'
            }else{
                alert(result.message);
            }
        }
    });
    return list;
}

function getDevList() {
    var devList;
    $.ajax({
        type: 'GET',
        xhrFields: {
            withCredentials: true // 这里设置了withCredentials
        },
        crossDomain: true,
        url: userurl+'/device/list',
        data: {},
        async:false,
        success: function (data) {
            var result = JSON.parse(data);
            // console.log(result.data);
            if(result.code === 101){
                devList = result.data;
            }else if(result.code === 5004){
                alert(result.message);
                window.location.href = '../admin-login-register/login.html'
            }else{
                alert(result.message);
            }
        },
        error: function(err) {
            console.error(err);
        }
    });
    return devList;
}

function getDevTagList() {
    var devList;
    $.ajax({
        type: 'GET',
        xhrFields: {
            withCredentials: true // 这里设置了withCredentials
        },
        crossDomain: true,
        url: userurl+'/device/tag',
        data: {},
        async:false,
        success: function (data) {
            var result = JSON.parse(data);
            // console.log(result.data);
            if(result.code === 101){
                devList = result.data;
            }else if(result.code === 5004){
                alert(result.message);
                window.location.href = '../admin-login-register/login.html'
            }else{
                alert(result.message);
            }
        },
        error: function(err) {
            console.error(err);
        }
    });
    return devList;
}

function getDevInfo(options) {
    var devInfo;
    $.ajax({
        type: 'GET',
        xhrFields: {
            withCredentials: true // 这里设置了withCredentials
        },
        crossDomain: true,
        url: userurl+'/device/show',
        data: options,
        async:false,
        success: function (data) {
            var result = JSON.parse(data);
            // console.log(result.data);
            if(result.code === 101){
                devInfo = result.data;
            }else if(result.code === 5004){
                alert(result.message);
                window.location.href = '../admin-login-register/login.html'
            }else{
                alert(result.message);
            }
        },
        error: function(err) {
            console.error(err);
        }
    });
    return devInfo;
}

function getInsList() {
    var insList;
    $.ajax({
        type: 'GET',
        xhrFields: {
            withCredentials: true // 这里设置了withCredentials
        },
        crossDomain: true,
        url: userurl+'/instrument/list',
        data: {},
        async:false,
        success: function (data) {
            var result = JSON.parse(data);
            // console.log(result.data);
            if(result.code === 101){
                insList = result.data;
            }else if(result.code === 5004){
                alert(result.message);
                window.location.href = '../admin-login-register/login.html'
            }else{
                alert(result.message);
            }
        },
        error: function(err) {
            console.error(err);
        }
    });
    return insList;
}

function getInsInfo(options) {
    var insInfo;
    $.ajax({
        type: 'GET',
        xhrFields: {
            withCredentials: true // 这里设置了withCredentials
        },
        crossDomain: true,
        url: userurl+'/instrument/show',
        data: options,
        async:false,
        success: function (data) {
            var result = JSON.parse(data);
            // console.log(result.data);
            if(result.code === 101){
                insInfo = result.data;
            }else if(result.code === 5004){
                alert(result.message);
                window.location.href = '../admin-login-register/login.html'
            }else{
                alert(result.message);
            }
        },
        error: function(err) {
            console.error(err);
        }
    });
    return insInfo;
}

function getUserList() {
    var userList;
    $.ajax({
        type: 'GET',
        xhrFields: {
            withCredentials: true // 这里设置了withCredentials
        },
        crossDomain: true,
        url: userurl+'/user/tag',
        data: {},
        async:false,
        success: function (data) {
            var result = JSON.parse(data);
            // console.log(result.data);
            if(result.code === 101){
                userList = result.data;
            }else if(result.code === 5004){
                alert(result.message);
                window.location.href = '../admin-login-register/login.html'
            }else{
                alert(result.message);
            }
        },
        error: function(err) {
            console.error(err);
        }
    });
    return userList;
}

function getGroup() {
    var userList;
    $.ajax({
        type: 'GET',
        xhrFields: {
            withCredentials: true // 这里设置了withCredentials
        },
        crossDomain: true,
        url: userurl+'/user/tagList',
        data: {},
        async:false,
        success: function (data) {
            var result = JSON.parse(data);
            // console.log(result.data);
            if(result.code === 101){
                userList = result.data;
            }else if(result.code === 5004){
                alert(result.message);
                window.location.href = '../admin-login-register/login.html'
            }else{
                alert(result.message);
            }
        },
        error: function(err) {
            console.error(err);
        }
    });
    return userList;
}

function getUserInfo(options) {
    var userInfo;
    $.ajax({
        type: 'GET',
        xhrFields: {
            withCredentials: true // 这里设置了withCredentials
        },
        crossDomain: true,
        url: userurl+'/user/show',
        data: options,
        async:false,
        success: function (data) {
            var result = JSON.parse(data);
            // console.log(result.data);
            if(result.code === 101){
                userInfo = result.data;
            }else if(result.code === 5004){
                alert(result.message);
                window.location.href = '../admin-login-register/login.html'
            }else{
                alert(result.message);
            }
        },
        error: function(err) {
            console.error(err);
        }
    });
    return userInfo;
}

function getPlanSolution() {
    var planList;
    $.ajax({
        type: 'GET',
        xhrFields: {
            withCredentials: true // 这里设置了withCredentials
        },
        crossDomain: true,
        url: userurl+'/plan/list',
        data: {},
        async:false,
        success: function (data) {
            var result = JSON.parse(data);
            // console.log(result.data);
            if(result.code === 101){
                planList = result.data;
            }else if(result.code === 5004){
                alert(result.message);
                window.location.href = '../admin-login-register/login.html'
            }else{
                alert(result.message);
            }
        },
        error: function(err) {
            console.error(err);
        }
    });
    return planList;
}

function getPLanSolutionInfo(options) {
    var pSInfo;
    $.ajax({
        type: 'GET',
        xhrFields: {
            withCredentials: true // 这里设置了withCredentials
        },
        crossDomain: true,
        url: userurl+'/plan/show',
        data: options,
        async:false,
        success: function (data) {
            var result = JSON.parse(data);
            // console.log(result.data);
            if(result.code === 101){
                pSInfo = result.data;
            }else if(result.code === 5004){
                alert(result.message);
                window.location.href = '../admin-login-register/login.html'
            }else{
                alert(result.message);
            }
        },
        error: function(err) {
            console.error(err);
        }
    });
    return pSInfo;
}

function getTestSoluList() {
    var soluList;
    $.ajax({
        type: 'GET',
        xhrFields: {
            withCredentials: true // 这里设置了withCredentials
        },
        crossDomain: true,
        url: userurl+'/solution/list',
        data: {},
        async:false,
        success: function (data) {
            var result = JSON.parse(data);
            // console.log(result.data);
            if(result.code === 101){
                soluList = result.data;
            }else if(result.code === 5004){
                alert(result.message);
                window.location.href = '../admin-login-register/login.html'
            }else{
                alert(result.message);
            }
        },
        error: function(err) {
            console.error(err);
        }
    });
    return soluList;
}

function getTestSolutionInfo(options) {
    var tSInfo;
    $.ajax({
        type: 'GET',
        xhrFields: {
            withCredentials: true // 这里设置了withCredentials
        },
        crossDomain: true,
        url: userurl+'/solution/show',
        data: options,
        async:false,
        success: function (data) {
            var result = JSON.parse(data);
            // console.log(result.data);
            if(result.code === 101){
                tSInfo = result.data;
            }else if(result.code === 5004){
                alert(result.message);
                window.location.href = '../admin-login-register/login.html'
            }else{
                alert(result.message);
            }
        },
        error: function(err) {
            console.error(err);
        }
    });
    return tSInfo;
}

function getAddressList() {
    var staList;
    $.ajax({
        type: 'GET',
        xhrFields: {
            withCredentials: true // 这里设置了withCredentials
        },
        crossDomain: true,
        url: userurl+'/station/list',
        data: {},
        async:false,
        success: function (data) {
            var result = JSON.parse(data);
            // console.log(result.data);
            if(result.code === 101){
                staList = result.data;
            }else if(result.code === 5004){
                alert(result.message);
                window.location.href = '../admin-login-register/login.html'
            }else{
                alert(result.message);
            }
        },
        error: function(err) {
            console.error(err);
        }
    });
    return staList;
}

function getAddressTag() {
    var staList;
    $.ajax({
        type: 'GET',
        xhrFields: {
            withCredentials: true // 这里设置了withCredentials
        },
        crossDomain: true,
        url: userurl+'/station/tag',
        data: {},
        async:false,
        success: function (data) {
            var result = JSON.parse(data);
            // console.log(result.data);
            if(result.code === 101){
                staList = result.data;
            }else if(result.code === 5004){
                alert(result.message);
                window.location.href = '../admin-login-register/login.html'
            }else{
                alert(result.message);
            }
        },
        error: function(err) {
            console.error(err);
        }
    });
    return staList;
}

function getAddressInfo(staID) {
    var staList;
    $.ajax({
        type: 'GET',
        xhrFields: {
            withCredentials: true // 这里设置了withCredentials
        },
        crossDomain: true,
        url: userurl+'/station/show',
        data: {
            'staID':staID
        },
        async:false,
        success: function (data) {
            var result = JSON.parse(data);
            // console.log(result.data);
            if(result.code === 101){
                staList = result.data;
            }else if(result.code === 5004){
                alert(result.message);
                window.location.href = '../admin-login-register/login.html'
            }else{
                alert(result.message);
            }
        },
        error: function(err) {
            console.error(err);
        }
    });
    return staList;
}

function getSheetList() {
    var sheetList;
    $.ajax({
        type: 'GET',
        xhrFields: {
            withCredentials: true // 这里设置了withCredentials
        },
        crossDomain: true,
        url: userurl+'/test/list',
        data: {},
        async:false,
        success: function (data) {
            var result = JSON.parse(data);
            // console.log(result.data);
            if(result.code === 101){
                sheetList = result.data;
            }else if(result.code === 5004){
                alert(result.message);
                window.location.href = '../admin-login-register/login.html'
            }else{
                alert(result.message);
            }
        },
        error: function(err) {
            console.error(err);
        }
    });
    return sheetList;
}

function getPlanSheetList() {
    var planList;
    $.ajax({
        type: 'GET',
        xhrFields: {
            withCredentials: true // 这里设置了withCredentials
        },
        crossDomain: true,
        url: userurl+'/planDan/list',
        data: {},
        async:false,
        success: function (data) {
            var result = JSON.parse(data);
            // console.log(result.data);
            if(result.code === 101){
                planList = result.data;
            }else if(result.code === 5004){
                alert(result.message);
                window.location.href = '../admin-login-register/login.html'
            }else{
                alert(result.message);
            }
        },
        error: function(err) {
            console.error(err);
        }
    });
    return planList;
}

function getPlanSheetInfo(options) {
    var pSInfo;
    $.ajax({
        type: 'GET',
        xhrFields: {
            withCredentials: true // 这里设置了withCredentials
        },
        crossDomain: true,
        url: userurl+'/planDan/show',
        data: options,
        async:false,
        success: function (data) {
            var result = JSON.parse(data);
            // console.log(result.data);
            if(result.code === 101){
                pSInfo = result.data;
            }else if(result.code === 5004){
                alert(result.message);
                window.location.href = '../admin-login-register/login.html'
            }else{
                alert(result.message);
            }
        },
        error: function(err) {
            console.error(err);
        }
    });
    return pSInfo;
}

function getPlanTestList(options) {
    var pSInfo;
    $.ajax({
        type: 'GET',
        xhrFields: {
            withCredentials: true // 这里设置了withCredentials
        },
        crossDomain: true,
        url: userurl+'/test/list',
        data: options,
        async:false,
        success: function (data) {
            var result = JSON.parse(data);
            // console.log(result.data);
            if(result.code === 101){
                pSInfo = result.data;
            }else if(result.code === 5004){
                alert(result.message);
                window.location.href = '../admin-login-register/login.html'
            }else{
                alert(result.message);
            }
        },
        error: function(err) {
            console.error(err);
        }
    });
    return pSInfo;
}

function getTestInfo(options) {
    var TestInfo;
    $.ajax({
        type: 'GET',
        xhrFields: {
            withCredentials: true // 这里设置了withCredentials
        },
        crossDomain: true,
        url: userurl+'/test/show',
        data: options,
        async:false,
        success: function (data) {
            var result = JSON.parse(data);
            // console.log(result.data);
            if(result.code === 101){
                TestInfo = result.data;
            }else if(result.code === 5004){
                alert(result.message);
                window.location.href = '../admin-login-register/login.html'
            }else{
                alert(result.message);
            }
        },
        error: function(err) {
            console.error(err);
        }
    });
    return TestInfo;
}

function getTestTaskList(options) {
    var pSInfo;
    $.ajax({
        type: 'GET',
        xhrFields: {
            withCredentials: true // 这里设置了withCredentials
        },
        crossDomain: true,
        url: userurl+'/task/list',
        data: options,
        async:false,
        success: function (data) {
            var result = JSON.parse(data);
            // console.log(result.data);
            if(result.code === 101){
                pSInfo = result.data;
            }else if(result.code === 5004){
                alert(result.message);
                window.location.href = '../admin-login-register/login.html'
            }else{
                alert(result.message);
            }
        },
        error: function(err) {
            console.error(err);
        }
    });
    return pSInfo;
}

function getManagerOptions(options) {
    var pSInfo;
    $.ajax({
        type: 'GET',
        xhrFields: {
            withCredentials: true // 这里设置了withCredentials
        },
        crossDomain: true,
        url: userurl+'/user/listByIDs',
        data: options,
        async:false,
        success: function (data) {
            var result = JSON.parse(data);
            // console.log(result.data);
            if(result.code === 101){
                pSInfo = result.data;
            }else if(result.code === 5004){
                alert(result.message);
                window.location.href = '../admin-login-register/login.html'
            }else{
                alert(result.message);
            }
        },
        error: function(err) {
            console.error(err);
        }
    });
    return pSInfo;
}

function getDeviceProject(options) {
    var pSInfo;
    $.ajax({
        type: 'GET',
        xhrFields: {
            withCredentials: true // 这里设置了withCredentials
        },
        crossDomain: true,
        url: userurl+'/device/devPro',
        data: options,
        async:false,
        success: function (data) {
            var result = JSON.parse(data);
            // console.log(result.data);
            if(result.code === 101){
                pSInfo = result.data;
            }else if(result.code === 5004){
                alert(result.message);
                window.location.href = '../admin-login-register/login.html'
            }else{
                alert(result.message);
            }
        },
        error: function(err) {
            console.error(err);
        }
    });
    return pSInfo;
}

function getTaskList() {
    var sheetList;
    $.ajax({
        type: 'GET',
        xhrFields: {
            withCredentials: true // 这里设置了withCredentials
        },
        crossDomain: true,
        url: userurl+'/task/list',
        data: {},
        async:false,
        success: function (data) {
            var result = JSON.parse(data);
            // console.log(result.data);
            if(result.code === 101){
                sheetList = result.data;
            }else if(result.code === 5004){
                alert(result.message);
                window.location.href = '../admin-login-register/login.html'
            }else{
                alert(result.message);
            }
        },
        error: function(err) {
            console.error(err);
        }
    });
    return sheetList;
}

function getTaskInfo(options) {
    var pSInfo;
    $.ajax({
        type: 'GET',
        xhrFields: {
            withCredentials: true // 这里设置了withCredentials
        },
        crossDomain: true,
        url: userurl+'/task/show',
        data: options,
        async:false,
        success: function (data) {
            var result = JSON.parse(data);
            // console.log(result.data);
            if(result.code === 101){
                pSInfo = result.data;
            }else if(result.code === 5004){
                alert(result.message);
                window.location.href = '../admin-login-register/login.html'
            }else{
                alert(result.message);
            }
        },
        error: function(err) {
            console.error(err);
        }
    });
    return pSInfo;
}

function getTaskDetail(options) {
    var pSInfo;
    $.ajax({
        type: 'GET',
        xhrFields: {
            withCredentials: true // 这里设置了withCredentials
        },
        crossDomain: true,
        url: userurl+'/task/detail',
        data: options,
        async:false,
        success: function (data) {
            var result = JSON.parse(data);
            // console.log(result.data);
            if(result.code === 101){
                pSInfo = result.data;
            }else if(result.code === 5004){
                alert(result.message);
                window.location.href = '../admin-login-register/login.html'
            }else{
                alert(result.message);
            }
        },
        error: function(err) {
            console.error(err);
        }
    });
    return pSInfo;
}

function getDeviceStation(options) {
    var pSInfo;
    $.ajax({
        type: 'GET',
        xhrFields: {
            withCredentials: true // 这里设置了withCredentials
        },
        crossDomain: true,
        url: userurl+'/device/getDevList',
        data: options,
        async:false,
        success: function (data) {
            var result = JSON.parse(data);
            // console.log(result.data);
            if(result.code === 101){
                pSInfo = result.data;
            }else if(result.code === 5004){
                alert(result.message);
                window.location.href = '../admin-login-register/login.html'
            }else{
                alert(result.message);
            }
        },
        error: function(err) {
            console.error(err);
        }
    });
    return pSInfo;
}

function getProjectRecord(options) {
    var pSInfo;
    $.ajax({
        type: 'GET',
        xhrFields: {
            withCredentials: true // 这里设置了withCredentials
        },
        crossDomain: true,
        url: userurl+'/data/getRecord',
        data: options,
        async:false,
        success: function (data) {
            var result = JSON.parse(data);
            // console.log(result.data);
            if(result.code === 101){
                pSInfo = result.data;
            }else if(result.code === 5004){
                alert(result.message);
                window.location.href = '../admin-login-register/login.html'
            }else{
                alert(result.message);
            }
        },
        error: function(err) {
            console.error(err);
        }
    });
    return pSInfo;
}

function getRecordItem(options) {
    var pSInfo;
    $.ajax({
        type: 'GET',
        xhrFields: {
            withCredentials: true // 这里设置了withCredentials
        },
        crossDomain: true,
        url: userurl+'/data/getItem',
        data: options,
        async:false,
        success: function (data) {
            var result = JSON.parse(data);
            // console.log(result.data);
            if(result.code === 101){
                pSInfo = result.data;
            }else if(result.code === 5004){
                alert(result.message);
                window.location.href = '../admin-login-register/login.html'
            }else{
                alert(result.message);
            }
        },
        error: function(err) {
            console.error(err);
        }
    });
    return pSInfo;
}

function getImgOptions(options) {
    var pSInfo;
    $.ajax({
        type: 'GET',
        xhrFields: {
            withCredentials: true // 这里设置了withCredentials
        },
        crossDomain: true,
        url: userurl+'/data/yDraw',
        data: options,
        async:false,
        success: function (data) {
            var result = JSON.parse(data);
            // console.log(result.data);
            if(result.code === 101){
                pSInfo = result.data;
            }else if(result.code === 5004){
                alert(result.message);
                window.location.href = '../admin-login-register/login.html'
            }else{
                alert(result.message);
            }
        },
        error: function(err) {
            console.error(err);
        }
    });
    return pSInfo;
}

function getReportList() {
    var sheetList;
    $.ajax({
        type: 'GET',
        xhrFields: {
            withCredentials: true // 这里设置了withCredentials
        },
        crossDomain: true,
        url: userurl+'/report/list',
        data: {},
        async:false,
        success: function (data) {
            var result = JSON.parse(data);
            // console.log(result.data);
            if(result.code === 101){
                sheetList = result.data;
            }else if(result.code === 5004){
                alert(result.message);
                window.location.href = '../admin-login-register/login.html'
            }else{
                alert(result.message);
            }
        },
        error: function(err) {
            console.error(err);
        }
    });
    return sheetList;
}

function getReportInfo(options) {
    var pSInfo;
    $.ajax({
        type: 'GET',
        xhrFields: {
            withCredentials: true // 这里设置了withCredentials
        },
        crossDomain: true,
        url: userurl+'/test/show',
        data: options,
        async:false,
        success: function (data) {
            var result = JSON.parse(data);
            // console.log(result.data);
            if(result.code === 101){
                pSInfo = result.data;
            }else if(result.code === 5004){
                alert(result.message);
                window.location.href = '../admin-login-register/login.html'
            }else{
                alert(result.message);
            }
        },
        error: function(err) {
            console.error(err);
        }
    });
    return pSInfo;
}

function getReportSolution() {
    var sheetList;
    $.ajax({
        type: 'GET',
        xhrFields: {
            withCredentials: true // 这里设置了withCredentials
        },
        crossDomain: true,
        url: userurl+'/solution/list',
        data: {},
        async:false,
        success: function (data) {
            var result = JSON.parse(data);
            // console.log(result.data);
            if(result.code === 101){
                sheetList = result.data;
            }else if(result.code === 5004){
                alert(result.message);
                window.location.href = '../admin-login-register/login.html'
            }else{
                alert(result.message);
            }
        },
        error: function(err) {
            console.error(err);
        }
    });
    return sheetList;
}

function getReportSolutionCover() {
    var sheetList;
    $.ajax({
        type: 'GET',
        xhrFields: {
            withCredentials: true // 这里设置了withCredentials
        },
        crossDomain: true,
        url: userurl+'/solution/cover',
        data: {},
        async:false,
        success: function (data) {
            var result = JSON.parse(data);
            // console.log(result.data);
            if(result.code === 101){
                sheetList = result.data;
            }else if(result.code === 5004){
                alert(result.message);
                window.location.href = '../admin-login-register/login.html'
            }else{
                alert(result.message);
            }
        },
        error: function(err) {
            console.error(err);
        }
    });
    return sheetList;
}

function getTaskSolution() {
    var sheetList;
    $.ajax({
        type: 'GET',
        xhrFields: {
            withCredentials: true // 这里设置了withCredentials
        },
        crossDomain: true,
        url: researchurl+'/project/list',
        data: {},
        async:false,
        success: function (data) {
            var result = JSON.parse(data);
            // console.log(result.data);
            if(result.code === 101){
                sheetList = result.data;
            }else if(result.code === 5004){
                alert(result.message);
                window.location.href = '../admin-login-register/login.html'
            }else{
                alert(result.message);
            }
        },
        error: function(err) {
            console.error(err);
        }
    });
    return sheetList;
}