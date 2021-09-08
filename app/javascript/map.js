var map;
function initMap() {
    map = new google.maps.Map(document.getElementById('map'), {
        center: { lat: 35.681, lng: 139.767 },
        zoom: 8
    });
}
// InvalidValueError: initMap is not a functionの対応
window.onload = function () {
    initMap();
}