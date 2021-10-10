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
    $("#checkbox").click(function(){
    if($("#checkbox").is(':checked') ){ // define what happens when box is being checked
        $(".select2_wells > option").prop("selected","selected");// Select All Options
        $(".select2_wells").trigger("change");
        ajaxODKdata();// Trigger changes to ensure selection is displayed in graph
    }else{ //define what happens when box is being unchecked
        $('.select2_wells').val(null).trigger('change');// Trigger change to select 2
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
    $("#checkbox1").click(function(){
    if($("#checkbox1").is(':checked') ){ // define what happens when box is being checked
        $(".select2_wells_offline > option").prop("selected","selected");// Select All Options
        $(".select2_wells_offline").trigger("change");
        ajaxOfflineLoggerdata();// Trigger changes to ensure selection is displayed in graph
    }else{ //define what happens when box is being unchecked
        $('.select2_wells_offline').val(null).trigger('change');// Trigger change to select 2
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


    $('.district').on('ifChanged', function(event) {
      var checked_box = []
      $('.district:checkbox:checked').each(function() {
        checked_box.push($(this).val())
      });

      if (checked_box.length > 1) {
        $('.select2_wells').empty().trigger('change');
        $(".select2_wells").select2({
          data: select2_options
        });
      } else {
        let options = filterwellsByDistrict(checked_box[0], select2_options)
        $('.select2_wells').empty().trigger('change');
        $(".select2_wells").select2({
          data: options
        });


        // $('.select2_wells').trigger('change');
      }

      console.log(checked_box);
    });
    $('.well_type').on('ifChanged', function() {
      var checked_box = []
      $('.well_type:checkbox:checked').each(function() {
        checked_box.push($(this).val())
      })
      console.log(checked_box);
    });





    // map location component
    // map location with other content will be here

    var map = L.map('map', {
      center: [27.9993613, 81.71946941],
      zoom: 9,
      layers: [osm, SW, DW]
    });
    var baseLayers = {
      "Grayscale": grayscale,
      "Streets": streets,
      "OSM Map": osm,
      "Google Map": googleStreets,
      "Google Satellite": googleHybrid
    };

    var overlays = {
      "DW Wells": DW,
      "SW Wells": SW
    };

    L.control.layers(baseLayers, overlays).addTo(map);





    // map classification component
    // map classification component of water level will be here

    // chlorepeth map
    var mapNew = L.map('mapNew').setView([27.9993613, 81.71946941], 9);

    L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
      attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
    }).addTo(mapNew);

    var colors_circle = ['#ff9ff3', '#ff6b6b', '#feca57', '#48dbfb', '#1dd1a1', '#FF9655', '#FFF263', '#6AF9C4'];

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

    L.geoJSON(gj, {
      pointToLayer: function(feature, latlng) {
        var circleColor;
        if (feature.properties.water_level < 5) {
          circleColor = colors_circle[0]
        } else if (feature.properties.water_level > 5 && feature.properties.water_level < 15) {
          circleColor = colors_circle[1]
        } else {
          circleColor = colors_circle[2]
        }
        return L.circleMarker(latlng, geojsonMarkerOptions(circleColor));
      }
    }).addTo(mapNew);
    var legend = L.control({
      position: 'bottomleft'
    });

    legend.onAdd = function(mapNew) {
      var div = L.DomUtil.create('div', 'info legend');
      for (var i = 0; i < 3; i++) {
        div.innerHTML +=
          '<div><span class="dot" style="background:' + colors_circle[i] + '"></span>' +
          'sample-' + String(i) + '</div>';
      }
      return div;
    }
    legend.addTo(mapNew);


    // let loggerChartContent = drawLineChart('data');
    // Highcharts.chart('containerLogger', loggerChartContent);


  });
