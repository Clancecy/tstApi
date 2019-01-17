var userurl = 'http://192.168.137.140:80';
var researchurl = 'http://192.168.137.140:8080/ES';



function addStation(pStaID) {
    var res = '';
    $.ajax({
        type: 'POST',
        xhrFields: {
            withCredentials: true // 这里设置了withCredentials
        },
        async:false,
        crossDomain: true,
        url: userurl+'/station/add',
        data: {
            'pStaID': pStaID,
            'staName': "新站点"
        },
        success: function (data) {
            res = JSON.parse(data);
        }
    });
    return res;
}

function updateStation(options) {
    var res = '';
    $.ajax({
        type: 'POST',
        xhrFields: {
            withCredentials: true // 这里设置了withCredentials
        },
        async:false,
        crossDomain: true,
        url: userurl+'/station/update',
        data: options,
        success: function (data) {
            res = JSON.parse(data);
        }
    });
    return res;
}

function delStation(options) {
    var res = '';
    $.ajax({
        type: 'POST',
        xhrFields: {
            withCredentials: true // 这里设置了withCredentials
        },
        async:false,
        crossDomain: true,
        url: userurl+'/station/delete',
        data: options,
        success: function (data) {
            res = JSON.parse(data);
        }
    });
    return res;
}

function delStaPic(options) {
    var res = '';
    $.ajax({
        type: 'POST',
        xhrFields: {
            withCredentials: true // 这里设置了withCredentials
        },
        async:false,
        crossDomain: true,
        url: userurl+'/station/delPic',
        data: options,
        success: function (data) {
            res = JSON.parse(data);
        }
    });
    return res;
}

function delDevFile(options) {
    var res = '';
    $.ajax({
        type: 'POST',
        xhrFields: {
            withCredentials: true // 这里设置了withCredentials
        },
        async:false,
        crossDomain: true,
        url: userurl+'/device/delFile',
        data: options,
        success: function (data) {
            res = JSON.parse(data);
        }
    });
    return res;
}

function addDevice(options) {
    var res = '';
    $.ajax({
        type: 'POST',
        xhrFields: {
            withCredentials: true // 这里设置了withCredentials
        },
        async:false,
        crossDomain: true,
        url: userurl+'/device/add',
        data: options,
        success: function (data) {
            res = JSON.parse(data);
        }
    });
    return res;
}

function delDevice(options) {
    var res = '';
    $.ajax({
        type: 'POST',
        xhrFields: {
            withCredentials: true // 这里设置了withCredentials
        },
        async:false,
        crossDomain: true,
        url: userurl+'/device/delete',
        data: options,
        success: function (data) {
            res = JSON.parse(data);
        }
    });
    return res;
}

function updateDevice(options) {
    var res = '';
    $.ajax({
        type: 'POST',
        xhrFields: {
            withCredentials: true // 这里设置了withCredentials
        },
        async:false,
        crossDomain: true,
        url: userurl+'/device/update',
        data: options,
        success: function (data) {
            res = JSON.parse(data);
        }
    });
    return res;
}

function addInstrument(options) {
    var res = '';
    $.ajax({
        type: 'POST',
        xhrFields: {
            withCredentials: true // 这里设置了withCredentials
        },
        async:false,
        crossDomain: true,
        url: userurl+'/instrument/add',
        data: options,
        success: function (data) {
            res = JSON.parse(data);
        }
    });
    return res;
}

function updateInstrument(options) {
    var res = '';
    $.ajax({
        type: 'POST',
        xhrFields: {
            withCredentials: true // 这里设置了withCredentials
        },
        async:false,
        crossDomain: true,
        url: userurl+'/instrument/update',
        data: options,
        success: function (data) {
            res = JSON.parse(data);
        }
    });
    return res;
}

function delInstrument(options) {
    var res = '';
    $.ajax({
        type: 'POST',
        xhrFields: {
            withCredentials: true // 这里设置了withCredentials
        },
        async:false,
        crossDomain: true,
        url: userurl+'/instrument/delete',
        data: options,
        success: function (data) {
            res = JSON.parse(data);
        }
    });
    return res;
}

function delInsFile(options) {
    var res = '';
    $.ajax({
        type: 'POST',
        xhrFields: {
            withCredentials: true // 这里设置了withCredentials
        },
        async:false,
        crossDomain: true,
        url: userurl+'/instrument/delFile',
        data: options,
        success: function (data) {
            res = JSON.parse(data);
        }
    });
    return res;
}

function addUser(options) {
    var res = '';
    $.ajax({
        type: 'POST',
        xhrFields: {
            withCredentials: true // 这里设置了withCredentials
        },
        async:false,
        crossDomain: true,
        url: userurl+'/user/add',
        data: options,
        success: function (data) {
            res = JSON.parse(data);
        }
    });
    return res;
}

function updateUser(options) {
    var res = '';
    $.ajax({
        type: 'POST',
        xhrFields: {
            withCredentials: true // 这里设置了withCredentials
        },
        async:false,
        crossDomain: true,
        url: userurl+'/user/update',
        data: options,
        success: function (data) {
            res = JSON.parse(data);
        }
    });
    return res;
}

function delUser(options) {
    var res = '';
    $.ajax({
        type: 'POST',
        xhrFields: {
            withCredentials: true // 这里设置了withCredentials
        },
        async:false,
        crossDomain: true,
        url: userurl+'/user/delete',
        data: options,
        success: function (data) {
            res = JSON.parse(data);
        }
    });
    return res;
}

function addGroup(options) {
    var res = '';
    $.ajax({
        type: 'POST',
        xhrFields: {
            withCredentials: true // 这里设置了withCredentials
        },
        async:false,
        crossDomain: true,
        url: userurl+'/user/addTag',
        data: options,
        success: function (data) {
            res = JSON.parse(data);
        }
    });
    return res;
}

function updateGroup(options) {
    var res = '';
    $.ajax({
        type: 'POST',
        xhrFields: {
            withCredentials: true // 这里设置了withCredentials
        },
        async:false,
        crossDomain: true,
        url: userurl+'/user/updateTag',
        data: options,
        success: function (data) {
            res = JSON.parse(data);
        }
    });
    return res;
}

function delGroup(options) {
    var res = '';
    $.ajax({
        type: 'POST',
        xhrFields: {
            withCredentials: true // 这里设置了withCredentials
        },
        async:false,
        crossDomain: true,
        url: userurl+'/user/delTag',
        data: options,
        success: function (data) {
            res = JSON.parse(data);
        }
    });
    return res;
}

function addPlanSolution(options) {
    var res = '';
    $.ajax({
        type: 'POST',
        xhrFields: {
            withCredentials: true // 这里设置了withCredentials
        },
        async:false,
        crossDomain: true,
        url: userurl+'/plan/add',
        data: options,
        success: function (data) {
            res = JSON.parse(data);
        }
    });
    return res;
}

function updatePlanSolution(options) {
    var res = '';
    $.ajax({
        type: 'POST',
        xhrFields: {
            withCredentials: true // 这里设置了withCredentials
        },
        async:false,
        crossDomain: true,
        url: userurl+'/plan/update',
        data: options,
        success: function (data) {
            res = JSON.parse(data);
        }
    });
    return res;
}

function delPlanSolution(options) {
    var res = '';
    $.ajax({
        type: 'POST',
        xhrFields: {
            withCredentials: true // 这里设置了withCredentials
        },
        async:false,
        crossDomain: true,
        url: userurl+'/plan/delete',
        data: options,
        success: function (data) {
            res = JSON.parse(data);
        }
    });
    return res;
}

function addTestSolution(options) {
    var res = '';
    $.ajax({
        type: 'POST',
        xhrFields: {
            withCredentials: true // 这里设置了withCredentials
        },
        async:false,
        crossDomain: true,
        url: userurl+'/solution/add',
        data: options,
        success: function (data) {
            res = JSON.parse(data);
        }
    });
    return res;
}

function updateTestSolution(options) {
    var res = '';
    $.ajax({
        type: 'POST',
        xhrFields: {
            withCredentials: true // 这里设置了withCredentials
        },
        async:false,
        crossDomain: true,
        url: userurl+'/solution/update',
        data: options,
        success: function (data) {
            res = JSON.parse(data);
        }
    });
    return res;
}

function delTestSolution(options) {
    var res = '';
    $.ajax({
        type: 'POST',
        xhrFields: {
            withCredentials: true // 这里设置了withCredentials
        },
        async:false,
        crossDomain: true,
        url: userurl+'/solution/delete',
        data: options,
        success: function (data) {
            res = JSON.parse(data);
        }
    });
    return res;
}

function addPlanSheet(options) {
    var res = '';
    $.ajax({
        type: 'POST',
        xhrFields: {
            withCredentials: true // 这里设置了withCredentials
        },
        async:false,
        crossDomain: true,
        url: userurl+'/planDan/add',
        data: options,
        success: function (data) {
            res = JSON.parse(data);
        }
    });
    return res;
}

function updatePlanSheet(options) {
    var res = '';
    $.ajax({
        type: 'POST',
        xhrFields: {
            withCredentials: true // 这里设置了withCredentials
        },
        async:false,
        crossDomain: true,
        url: userurl+'/planDan/update',
        data: options,
        success: function (data) {
            res = JSON.parse(data);
        }
    });
    return res;
}

function delPlanSheet(options) {
    var res = '';
    $.ajax({
        type: 'POST',
        xhrFields: {
            withCredentials: true // 这里设置了withCredentials
        },
        async:false,
        crossDomain: true,
        url: userurl+'/planDan/delete',
        data: options,
        success: function (data) {
            res = JSON.parse(data);
        }
    });
    return res;
}

function importPlanSolution(options) {
    var res = '';
    $.ajax({
        type: 'POST',
        xhrFields: {
            withCredentials: true // 这里设置了withCredentials
        },
        async:false,
        crossDomain: true,
        url: userurl+'/planDan/load',
        data: options,
        success: function (data) {
            res = JSON.parse(data);
        }
    });
    return res;
}

function exportPlanSolution(options) {
    var res = '';
    $.ajax({
        type: 'POST',
        xhrFields: {
            withCredentials: true // 这里设置了withCredentials
        },
        async:false,
        crossDomain: true,
        url: userurl+'/planDan/save',
        data: options,
        success: function (data) {
            res = JSON.parse(data);
        }
    });
    return res;
}

function addTestSheet(options) {
    var res = '';
    $.ajax({
        type: 'POST',
        xhrFields: {
            withCredentials: true // 这里设置了withCredentials
        },
        async:false,
        crossDomain: true,
        url: userurl+'/test/add',
        data: options,
        success: function (data) {
            res = JSON.parse(data);
        }
    });
    return res;
}

function updateTestSheet(options) {
    var res = '';
    $.ajax({
        type: 'POST',
        xhrFields: {
            withCredentials: true // 这里设置了withCredentials
        },
        async:false,
        crossDomain: true,
        url: userurl+'/test/update',
        data: options,
        success: function (data) {
            res = JSON.parse(data);
        }
    });
    return res;
}

function delTestSheet(options) {
    var res = '';
    $.ajax({
        type: 'POST',
        xhrFields: {
            withCredentials: true // 这里设置了withCredentials
        },
        async:false,
        crossDomain: true,
        url: userurl+'/test/delete',
        data: options,
        success: function (data) {
            res = JSON.parse(data);
        }
    });
    return res;
}

function importTestSolution(options) {
    var res = '';
    $.ajax({
        type: 'POST',
        xhrFields: {
            withCredentials: true // 这里设置了withCredentials
        },
        async:false,
        crossDomain: true,
        url: userurl+'/test/load',
        data: options,
        success: function (data) {
            res = JSON.parse(data);
        }
    });
    return res;
}

function exportTestSolution(options) {
    var res = '';
    $.ajax({
        type: 'POST',
        xhrFields: {
            withCredentials: true // 这里设置了withCredentials
        },
        async:false,
        crossDomain: true,
        url: userurl+'/test/save',
        data: options,
        success: function (data) {
            res = JSON.parse(data);
        }
    });
    return res;
}

function addTask(options) {
    var res = '';
    $.ajax({
        type: 'POST',
        xhrFields: {
            withCredentials: true // 这里设置了withCredentials
        },
        async:false,
        crossDomain: true,
        url: userurl+'/task/add',
        data: options,
        success: function (data) {
            res = JSON.parse(data);
        }
    });
    return res;
}

function updateTask(options) {
    var res = '';
    $.ajax({
        type: 'POST',
        xhrFields: {
            withCredentials: true // 这里设置了withCredentials
        },
        async:false,
        crossDomain: true,
        url: userurl+'/task/update',
        data: options,
        success: function (data) {
            res = JSON.parse(data);
        }
    });
    return res;
}

function delTask(options) {
    var res = '';
    $.ajax({
        type: 'POST',
        xhrFields: {
            withCredentials: true // 这里设置了withCredentials
        },
        async:false,
        crossDomain: true,
        url: userurl+'/task/delete',
        data: options,
        success: function (data) {
            res = JSON.parse(data);
        }
    });
    return res;
}

function addVertical(options) {
    var res = '';
    $.ajax({
        type: 'POST',
        xhrFields: {
            withCredentials: true // 这里设置了withCredentials
        },
        async:false,
        crossDomain: true,
        url: userurl+'/tSolution/add',
        data: options,
        success: function (data) {
            res = JSON.parse(data);
        }
    });
    return res;
}

function updateVertical(options) {
    var res = '';
    $.ajax({
        type: 'POST',
        xhrFields: {
            withCredentials: true // 这里设置了withCredentials
        },
        async:false,
        crossDomain: true,
        url: userurl+'/tSolution/update',
        data: options,
        success: function (data) {
            res = JSON.parse(data);
        }
    });
    return res;
}

function delVertical(options) {
    var res = '';
    $.ajax({
        type: 'POST',
        xhrFields: {
            withCredentials: true // 这里设置了withCredentials
        },
        async:false,
        crossDomain: true,
        url: userurl+'/tSolution/delete',
        data: options,
        success: function (data) {
            res = JSON.parse(data);
        }
    });
    return res;
}

function addCover(options) {
    var res = '';
    $.ajax({
        type: 'POST',
        xhrFields: {
            withCredentials: true // 这里设置了withCredentials
        },
        async:false,
        crossDomain: true,
        url: userurl+'/solution/addCover',
        data: options,
        success: function (data) {
            res = JSON.parse(data);
        }
    });
    return res;
}


function projectReview(options) {
    var res = '';
    $.ajax({
        type: 'POST',
        xhrFields: {
            withCredentials: true // 这里设置了withCredentials
        },
        async:false,
        crossDomain: true,
        url: researchurl+'/project/report',
        data: options,
        success: function (data) {
            res = JSON.parse(data);
        }
    });
    return res;
}

function reportSolutionReview(options) {
    var res = '';
    $.ajax({
        type: 'POST',
        xhrFields: {
            withCredentials: true // 这里设置了withCredentials
        },
        async:false,
        crossDomain: true,
        url: researchurl+'/project/report',
        data: options,
        success: function (data) {
            res = JSON.parse(data);
        }
    });
    return res;
}


function addDataSolution(options) {
    var res = '';
    $.ajax({
        type: 'POST',
        xhrFields: {
            withCredentials: true // 这里设置了withCredentials
        },
        async:false,
        crossDomain: true,
        url: userurl+'/analysis/add',
        data: options,
        success: function (data) {
            res = JSON.parse(data);
        }
    });
    return res;
}

function updateDataSolution(options) {
    var res = '';
    $.ajax({
        type: 'POST',
        xhrFields: {
            withCredentials: true // 这里设置了withCredentials
        },
        async:false,
        crossDomain: true,
        url: userurl+'/analysis/update',
        data: options,
        success: function (data) {
            res = JSON.parse(data);
        }
    });
    return res;
}

function delDataSolution(options) {
    var res = '';
    $.ajax({
        type: 'POST',
        xhrFields: {
            withCredentials: true // 这里设置了withCredentials
        },
        async:false,
        crossDomain: true,
        url: userurl+'/analysis/delete',
        data: options,
        success: function (data) {
            res = JSON.parse(data);
        }
    });
    return res;
}