  $(document).ready(function() {
    // normal JS component
    // normal DOM manipulation will be here


    $('.chosen-select').chosen({
      width: "100%"
    });

    $(".select2_wells").select2({
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
      // filter gejson and map
      var featureData = filterGeojson(gj.features, checked_dst_box, checked_wt_box);
      var filtered_locations = {
        "name": "MyFeatureType",
        "type": "FeatureCollection",
        "features": featureData
      };
      map.removeLayer(wellsLayer);
      mapNew.removeLayer(wellsLayer_classify);

      wellsLayer = L.geoJSON(filtered_locations, {
        onEachFeature: onEachFeature
      }).addTo(map);

      var featureDataClassify = filterGeojson(gj_latest_water_level.features, checked_dst_box, checked_wt_box);
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
    //   "Wells": wellsLayer
    // };

    L.control.layers(baseLayers).addTo(map);

    // const layerAddToMap = () => {
    //   map.removeLayer(wellsLayer);
    //   var districtSelected = $('.district:checkbox:checked');
    //   var temp_gj =gj
    //   // var wellTypeSelected = $('.well_type').val();
    //   if (districtSelected.length>1) {
    //     wellsLayer = L.geoJSON(temp_gj, {
    //       onEachFeature: onEachFeature
    //     }).addTo(map);
    //   } else if (districtSelected.length<1) {
    //
    //   } else {
    //     wellsLayer = L.geoJSON(temp_gj, {
    //       onEachFeature: onEachFeature,
    //       filter: districtFilter
    //     }).addTo(map);
    //   }
    //
    //   function districtFilter(feature, layer) {
    //     var return_value = false;
    //
    //     districtSelected.each(function(item) {
    //       return_value=false;
    //       var dist = $(this).val();
    //
    //         if (feature.properties.district === dist) {
    //           return_value=true;
    //           return true
    //         }
    //         return return_value
    //       });
    //       return return_value
    //     }
    //
    //
    //   // wellsLayer.addTo(map);
    // }



    // map classification component
    // map classification component of water level will be here

    // chlorepeth map
    var mapNew = L.map('mapNew').setView([27.9993613, 81.71946941], 9);

    googleHybrid.addTo(mapNew);

    var colors_circle = ['#ff9ff3', '#ff6b6b', '#feca57', '#48dbfb', '#1dd1a1', '#FF9655', '#FFF263', '#6AF9C4'];
    var legend_label = [' <3m', ' 3m-6m', ' >6m']

    function geojsonMarkerOptions(color) {
      return {
        radius: 5,
        fillColor: color,
        color: "#fff",
        weight: 1,
        opacity: 1,
        fillOpacity: 0.8
      }
    }

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
      if (feature.properties.water_level < 3) {
        circleColor = colors_circle[0]
      } else if (feature.properties.water_level > 3 && feature.properties.water_level < 6) {
        circleColor = colors_circle[1]
      } else {
        circleColor = colors_circle[2]
      }
      return L.circleMarker(latlng, geojsonMarkerOptions(circleColor));
    }

    wellsLayer_classify = L.geoJSON(gj_latest_water_level, {
      onEachFeature: onEachFeaturePopUp,
      pointToLayer: classifyFeature
    }).addTo(mapNew);
    var legend = L.control({
      position: 'bottomleft'
    });

    legend.onAdd = function(mapNew) {
      var div = L.DomUtil.create('div', 'info legend');
      for (var i = 0; i < 3; i++) {
        div.innerHTML +=
          '<div><span class="dot" style="background:' + colors_circle[i] + '"></span>' +
          ' Water Level: ' + legend_label[i] + '</div>';
      }
      return div;
    }
    legend.addTo(mapNew);


    // let loggerChartContent = drawLineChart('data');
    // Highcharts.chart('containerLogger', loggerChartContent);


    layersSwitcher();
  });
