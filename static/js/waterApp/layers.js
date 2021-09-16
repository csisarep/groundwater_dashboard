var mbAttr = 'Map data &copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors, ' +
  'Imagery © <a href="https://www.mapbox.com/">Mapbox</a>',
  mbUrl = 'https://api.mapbox.com/styles/v1/{id}/tiles/{z}/{x}/{y}?access_token=pk.eyJ1IjoibWFwYm94IiwiYSI6ImNpejY4NXVycTA2emYycXBndHRqcmZ3N3gifQ.rJcFIG214AriISLbB6B5aw';

var grayscale = L.tileLayer(mbUrl, {
  id: 'mapbox/light-v9',
  tileSize: 512,
  zoomOffset: -1,
  attribution: mbAttr
});
var streets = L.tileLayer(mbUrl, {
  id: 'mapbox/streets-v11',
  tileSize: 512,
  zoomOffset: -1,
  attribution: mbAttr
});
var osm = L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
  attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
});


function onEachFeature(feature, layer) {
  var content ="<p>District:  "+feature.properties.district+"</p>";
  content+="<p>Place: "+feature.properties.place+"</p>";
  content+="<p>Well Number: "+feature.properties.well_number+"</p>";
  content+="<p>Well Type: "+feature.properties.type+"</p>";
  if (feature.properties) {
      layer.bindPopup(content);
  }
}
var wellsLayer = L.geoJSON(gj, {
  onEachFeature: onEachFeature
})

var googleStreets = L.tileLayer('http://{s}.google.com/vt/lyrs=m&x={x}&y={y}&z={z}',{
    maxZoom: 20,
    subdomains:['mt0','mt1','mt2','mt3']
});
var googleHybrid = L.tileLayer('http://{s}.google.com/vt/lyrs=s,h&x={x}&y={y}&z={z}',{
  maxZoom: 20,
  subdomains:['mt0','mt1','mt2','mt3']
});
