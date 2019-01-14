function handleClick(e) {
    var point = new Array();
    point.push(e.lnglat.getLng());
    point.push(e.lnglat.getLat());
    return point;
}

function flushTree(addressList) {
    for(i in addressList){
        if(!addressList[i].children){
            addressList[i].isLeaf = true;
        }else{
            addressList[i].isLeaf = false;
            flushTree(addressList[i].children);
        }
    }
}

function returnTree(children, addressList) {
    for(i in addressList){
        if(!addressList[i].children){
            children.push(addressList[i].children);
        }else{
            flushTree(addressList[i].children);
        }
    }
    return children;
}

function flashTree(map, addressList) {
    for(i in addressList){
        if(!addressList[i].children){
            map.add(new AMap.Marker({
                position: new AMap.LngLat(addressList[i].longitude, addressList[i].latitude),
                content: '<i class="fa fa-bandcamp"></i>',// 经纬度对象，也可以是经纬度构成的一维数组[116.39, 39.9]
                title: addressList[i].name
            }));
        }else{
            flashTree(map,addressList[i].children);
        }
    }
}

function showInfoM(e){
    var text = '您在 [ '+e.lnglat.getLng()+','+e.lnglat.getLat()+' ] 的位置点击了marker！';
    document.querySelector("#text").innerText = text;
}

function clickOn() {
    marker.on('click', showInfoM);
}