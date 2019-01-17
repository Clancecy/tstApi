// 控件
var mTbody = null;
var mColCount = 0; // 表格最大列数
var mClickAble = false;

// 数据
var mProFullData = null;
var mDictData = null; // 记录表格'rowIndex-cellIndex'对应的chunkIndex, recordIndex, itemIndex

/**
 * 显示任务数据
 */
function showProRecords(tbody, proFullData, clickable) {
    mTbody = tbody || mTbody;
    mProFullData = proFullData || mProFullData;
    if (null == clickable || false == clickable) {
        mClickAble = false;
    } else {
        mClickAble = true;
    }

    // 错误处理
    if (null == mProFullData || null == mProFullData.proRecord) {
        mTbody.innerText = "项目数据为空或者请求错误";
        return;
    }

    // 刷新或者获取控件
    mTbody.innerHTML = '';
    mDictData = new Array();

    var proRecord = mProFullData.proRecord;
    countMaxCol(proRecord);
    document.getElementById('thProHead').colSpan = mColCount;
    for (var chunkIndex = 0; chunkIndex < proRecord.length; chunkIndex++) {
        var chunk = proRecord[chunkIndex];
        var record = chunk.records[0];
        // 如果chunk名和record名说明只是单纯标记，显示一行，否则显示为子表的格式(多行)
        if (chunk.recordName == record.recordName) {
            showChunkOneLine(mTbody, proRecord, chunkIndex);
        } else {
            showChunkMultiLine(mTbody, proRecord, chunkIndex);
        }
    }

    if (mClickAble) {
        // 表格点击事件委托
        $(mTbody).click(function (e) {
            onTableClick(e);
        });
    }
}

/**
 * 计算最大列数
 */
function countMaxCol(proRecord) {
    for (var i = 0; i < proRecord.length; i++) {
        var chunk = proRecord[i];
        for (var j = 0; j < chunk.records.length; j++) {
            var record = chunk.records[j];
            var col = 0;
            if (record.recordName == chunk.recordName) {
                col += record.itemList.length * 2;
                if (record.recordName != record.itemList[0].itemName) {
                    col += 1;
                }
            } else {
                col = 1 + record.itemList.length;
            }
            mColCount = Math.max(mColCount, col);
        }
    }
    // console.log(mColCount);
}

/**
 * 显示单行chunk
 */
function showChunkOneLine(tbody, records, chunkIndex) {
    var chunk = records[chunkIndex];
    var recordList = chunk.records;
    for (var recordIndex = 0; recordIndex < recordList.length; recordIndex++) {
        var tr = tbody.insertRow();
        var record = recordList[recordIndex];
        var itemList = record.itemList;
        // 只设置名称跨列
        var colName = itemList.length;
        var colSpan = Math.floor(mColCount / (2 * colName + itemList.length));

        // 是否显示记录名, 等于则不显示
        if (itemList[0].itemName != record.recordName) {
            var tdRecord = tr.insertCell();
            tdRecord.innerText = record.recordName;
            // 多显示一个
            colName += 1;
            colSpan = Math.floor(mColCount / (2 * colName + itemList.length));
            tdRecord.colSpan = colSpan * 2;

            // 添加字典
            setDictData(tr.rowIndex, tdRecord.cellIndex, chunkIndex, recordIndex);
        }

        // 显示item
        for (var itemIndex = 0; itemIndex < itemList.length; itemIndex++) {
            var item = itemList[itemIndex];
            var tdName = tr.insertCell();
            tdName.innerText = item.itemName;
            tdName.colSpan = colSpan * 2;
            // 根据item的类型显示值
            var tdValue = tr.insertCell();
            showItemValue(tdValue, item);
            tdValue.colSpan = colSpan;
            if (itemIndex == itemList.length - 1) {
                tdValue.colSpan = mColCount - (colSpan * 2 * colName) - colSpan * itemIndex;
            }

            // 添加字典
            setDictData(tr.rowIndex, tdName.cellIndex, chunkIndex, recordIndex, itemIndex);
            setDictData(tr.rowIndex, tdValue.cellIndex, chunkIndex, recordIndex, itemIndex);
        }
    }
}

/**
 * 显示多行chunk
 */
function showChunkMultiLine(tbody, records, chunkIndex) {
    var chunk = records[chunkIndex];
    var recordList = chunk.records;

    // 显示表头
    var trTitle = tbody.insertRow();
    var itemTems = recordList[0].itemList;
    var tdChunk = trTitle.insertCell();
    tdChunk.innerText = chunk.recordName;
    // 跨列
    var colSpan = Math.floor(mColCount / (1 + itemTems.length));
    tdChunk.colSpan = colSpan;
    tdChunk.style.verticalAlign = 'middle';

    // 添加字典
    setDictData(trTitle.rowIndex, tdChunk.cellIndex, chunkIndex);

    // 列名
    for (var i = 0; i < itemTems.length; i++) {
        var tdTitle = trTitle.insertCell();
        tdTitle.innerText = itemTems[i].itemName;
        tdTitle.style.verticalAlign = 'middle';
        tdTitle.colSpan = colSpan;
        if (i == itemTems.length - 1) {
            tdTitle.colSpan = mColCount - (colSpan * itemTems.length);
        }
        setDictData(trTitle.rowIndex, tdTitle.cellIndex, chunkIndex);
    }
    // trTitle.className = "active";

    // 显示记录
    for (var recordIndex = 0; recordIndex < recordList.length; recordIndex++) {
        addRecordRow(tbody, chunk, chunkIndex, recordIndex);
    }
}

/**
 * 添加记录行
 */
function addRecordRow(tbody, chunk, chunkIndex, recordIndex) {
    var record = chunk.records[recordIndex];
    var itemList = record.itemList;
    var colSpan = Math.floor(mColCount / (1 + itemList.length));

    // 动态表格
    var trRecord = tbody.insertRow();
    var tdRecord = trRecord.insertCell();
    tdRecord.colSpan = colSpan;
    if (Math.floor(record.recordName).toString() == 'NaN') {
        tdRecord.innerText = record.recordName;
    } else {
        tdRecord.innerText = Math.floor(record.recordName);
    }
    setDictData(trRecord.rowIndex, tdRecord.cellIndex, chunkIndex, recordIndex);

    for (var itemIndex = 0; itemIndex < itemList.length; itemIndex++) {
        var item = itemList[itemIndex];
        var tdValue = trRecord.insertCell();
        showItemValue(tdValue, item); // 根据item的类型显示值
        tdValue.colSpan = colSpan;
        if (itemIndex == itemList.length - 1) {
            tdValue.colSpan = mColCount - (colSpan * itemList.length);
        }
        setDictData(trRecord.rowIndex, tdValue.cellIndex, chunkIndex, recordIndex, itemIndex);
    }
}

/**
 * 根据item的类型显示值
 */
function showItemValue(td, item) {
    // 如果是公式保留两位小数
    if (item.itemType == "FORMULA") {
        var num = new Number(item.itemVal);
        td.innerText = num.toFixed(2);
    } else {
        td.innerText = item.itemVal;
        td.style.backgroundColor = '#eee';
        // td.style.fontWeight = 'bold';
    }
}

/**
 * 设置字典
 */
function setDictData(rowIndex, cellIndex, chunkIndex, recordIndex, itemIndex) {
    mDictData[rowIndex + '-' + cellIndex] = {
        'chunkIndex': chunkIndex,
        'recordIndex': recordIndex,
        'itemIndex': itemIndex
    };
}

/**
 * 表格点击事件
 */
function onTableClick(e) {
    var td = e.target;
    var tr = e.target.parentNode;
    var tdData = mDictData[tr.rowIndex + '-' + td.cellIndex];
    var chunk = mProFullData.proRecord[tdData['chunkIndex']];
    var record = tdData['recordIndex'] == null ? null : chunk.records[tdData['recordIndex']];
    var item = tdData['itemIndex'] == null ? null : record.itemList[tdData['itemIndex']];
    var mode = mProFullData.proModes[0];
}
