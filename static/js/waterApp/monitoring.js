$(document).ready(function() {
  // normal JS component
  // normal DOM manipulation will be here



  $('.chosen-select').chosen({
    width: "100%"
  });


  // Using jquery select2 for enabling search of selections and better graphics
  // Modifying selection form of ODK measurements
  $('.select2_wells').select2({
    data: select2_options
  });

  $('.select2_wells').val('Rohini Khola'); // Select the option with a value of '1'
  $('.select2_wells').trigger('change');

  $('.select2_wells').on('select2:select', function(e) {
    // var selected_wells =
    ajaxODKdata();
  });
  $('.select2_wells').on('select2:unselect', function(e) {
    ajaxODKdata();
  });
  ajaxODKdata();

  // Link to checkbox positioned above the selection form for selecting and deselecting all options
  $("#checkbox").click(function() {
    if ($("#checkbox").is(':checked')) { // define what happens when box is being checked
      $(".select2_wells > option").prop("selected", "selected"); // Select All Options
      $(".select2_wells").trigger("change");
      ajaxODKdata(); // Trigger changes to ensure selection is displayed in graph
    } else { //define what happens when box is being unchecked
      $('.select2_wells').val(null).trigger('change'); // Trigger change to select 2
      $(".select2_wells").trigger("change");
      ajaxODKdata(); // Trigger changes to ensure selection is displayed in graph
    }
  });



  // Modifying selection form for offline data loggers
  //
  $(".select2_wells_offline").select2({
    data: select2_options_offline
  });
  // Select all
  $('.select2_wells_offline').select2('destroy').find('option').prop('selected', 'selected').end().select2();

  $('.select2_wells_offline').on('select2:select', function(e) {
    // var selected_wells =
    ajaxOfflineLoggerdata();
  });
  $('.select2_wells_offline').on('select2:unselect', function(e) {
    ajaxOfflineLoggerdata();
  });
  ajaxOfflineLoggerdata();


  // Link to checkbox positioned above the selection form for selecting and deselecting all options
  $("#checkbox1").click(function() {
    if ($("#checkbox1").is(':checked')) { // define what happens when box is being checked
      $(".select2_wells_offline > option").prop("selected", "selected"); // Select All Options
      $(".select2_wells_offline").trigger("change");
      ajaxOfflineLoggerdata(); // Trigger changes to ensure selection is displayed in graph
    } else { //define what happens when box is being unchecked
      $('.select2_wells_offline').val(null).trigger('change'); // Trigger change to select 2
      $(".select2_wells_offline").trigger("change");
      ajaxOfflineLoggerdata(); // Trigger changes to ensure selection is displayed in graph
    }
  });


  // Checkbox for historical well graph select all
  // Link to checkbox positioned above the selection form for selecting and deselecting all options



  // $('.select2_wells').val(null).trigger('change');

  $('.i-checks').iCheck({
    checkboxClass: 'icheckbox_square-green',
    radioClass: 'iradio_square-green',
  });

  $('.dst_wt').on('ifChanged', function() {
    layersSwitcher();
  });

  const layersSwitcher = () => {
    var checked_wt_box = []
    $('.well_type:checkbox:checked').each(function() {
      checked_wt_box.push($(this).val())
    })
    var checked_dst_box = []
    $('.district:checkbox:checked').each(function() {
      checked_dst_box.push($(this).val())
    });

    // dropdown selectbox
    let options = filterwellsByDistrict(checked_dst_box, select2_options)
    $('.select2_wells').empty().trigger('change');
    $(".select2_wells").select2({
      data: options
    });
    // filter ge0json and map
    var featureData = filterGeojson(gj1.features, checked_dst_box, checked_wt_box);
    var filtered_locations = {
      "name": "MyFeatureType",
      "type": "FeatureCollection",
      "features": featureData
    };
    map.removeLayer(wellsLayer);
    mapNew.removeLayer(wellsLayer_classify);

    wellsLayer = L.geoJSON(filtered_locations, {
      onEachFeature: onEachFeature,
      pointToLayer: classifyMarker
    }).addTo(map);

    var featureDataClassify = filterGeojson(odk.features, checked_dst_box, checked_wt_box);
    // console.log(featureDataClassify);
    var filtered_locations_classify = {
      "name": "MyFeatureType",
      "type": "FeatureCollection",
      "features": featureDataClassify
    };
    wellsLayer_classify = L.geoJSON(filtered_locations_classify, {
      onEachFeature: onEachFeaturePopUp,
      pointToLayer: classifyFeature
    }).addTo(mapNew);
  };



  // map location component
  // map location with other content will be here

  var map = L.map('map', {
    center: [27.9993613, 81.71946941],
    zoom: 9,
    layers: [osm, wellsLayer]
  });
  var baseLayers = {
    "Grayscale": grayscale,
    "Streets": streets,
    "OSM Map": osm,
    "Google Map": googleStreets,
    "Google Satellite": googleHybrid
  };

  // var overlays = {
  //   "DW Wells": DW,
  //   "SW Wells": SW
  // };

  L.control.layers(baseLayers).addTo(map);





  // map classification component
  // map classification component of water level will be here

  // chlorepeth map



  //sort wells, then delete all older than 30 days, then delete all duplicates. For now 60 days as Kobo updates are not implemented yet.

  var date = new Date();
  date.setDate(date.getDate() - 60);
  var cutOffDate = date.toISOString().split('T')[0];
  odk.features = Object.entries(odk.features);


  odk.features = odk.features.filter(recent => recent[1].properties.date > cutOffDate);


  //assume that entries are ordered chronologically. Only take first occurence of a well number and add number of duplicated
  //for removal later. Then go backwards through index for splicing to not mess up indexes.

  //Bardiya does not have well numbers. Some issue in the update csv routine. Removing the well filtering for now.
  /*
  var nums = [];
  var index = [];
  for (x in odk.features) {
    console.log(x);
    if (!nums.includes(odk.features[x][1].properties.well_number)) {
    nums.push(odk.features[x][1].properties.well_number);
    } else {

    index.push(x);
  }
  }

  for (var i = index.length -1; i >= 0; i--){
     odk.features.splice(index[i],1);
  }
  */

  for (x of odk.features) {
    x[1].properties.gw_level = parseFloat(x[1].properties.gw_level);
  }

  //some issue with nested array occured in copying, remove unnecesarrt layer and flatten for proper recoginition as FeatureCollection
  for (const x of odk.features) {
    x.splice(0, 1);
  }

  odk.features = odk.features.flat(Infinity);


  //start creating latest ODK map. TODO Better ID naming
  var mapNew = L.map('mapNew', {
    center: [27.9993613, 81.71946941],
    zoom: 9,
    layers: [osm]
  });


  L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
    attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
  }).addTo(mapNew);


  // Defining colors for categories of water levels
  // TODO automatic update of thehsolds in legend and color coding
  var colors_circle = ['#1dd1a1', '#feca57', '#ff6b6b', '#FF9655', '#FFF263', '#6AF9C4'];

  function geojsonMarkerOptions(color) {
    return {
      radius: 8,
      fillColor: color,
      color: "#000",
      weight: 1,
      opacity: 1,
      fillOpacity: 0.8
    }
  }

  // add popup to points/circles

  function onEachFeaturePopUp(feature, layer) {
    // popup enabled
    var content = "<p>District:  " + feature.properties.district + "</p>";
    content += "<p>Well Number: " + feature.properties.well_number + "</p>";
    content += "<p>Well Type: " + feature.properties.type + "</p>";
    content += "<p>Water Level: " + feature.properties.water_level + "</p>";
    if (feature.properties) {
      layer.bindPopup(content);
    }

  }

  function classifyFeature(feature, latlng) {
    // clasification of points based upon water level
    var circleColor;
    if (feature.properties.gw_level < 2) {
      circleColor = colors_circle[0]
    } else if (feature.properties.gw_level > 2 && feature.properties.gw_level < 5) {
      circleColor = colors_circle[1]
    } else {
      circleColor = colors_circle[2]
    }
    return L.circleMarker(latlng, geojsonMarkerOptions(circleColor));
  }
  wellsLayer_classify = L.geoJSON(odk, {
    onEachFeature: onEachFeaturePopUp,
    pointToLayer: classifyFeature
  }).addTo(mapNew);
  var legend = L.control({
    position: 'bottomleft'
  });

  var thresh = [' < 2 mbgl', ' < 5 mbgl', ' > 5 mbgl']

  // define legend content and add legend to map
  legend.onAdd = function(mapNew) {
    var div = L.DomUtil.create('div', 'info legend');
    for (var i = 0; i < 3; i++) {
      div.innerHTML +=
        '<div><span class="dot" style="background:' + colors_circle[i] + '"></span>' +
        thresh[i] + '</div>';
    }
    return div;
  }
  legend.addTo(mapNew);

  // let loggerChartContent = drawLineChart('data');
  // Highcharts.chart('containerLogger', loggerChartContent);

  layersSwitcher();
});