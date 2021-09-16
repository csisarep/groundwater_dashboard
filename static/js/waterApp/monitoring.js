  $(document).ready(function() {
    // normal JS component
    // normal DOM manipulation will be here
    const multilineData = (data) => {
      let kk = [{
        name: 'flow',
        data: data,
        tooltip: {
          valueDecimals: 2
        }
      }];
      let stock_data=[];

      for (let key of Object.keys(data)){
        console.log(key);
        let data_new_format =data[key]['data']
        let data_new = [];
        for (i=0;i<data_new_format.length;i=i+1){
          let time_ = new Date(data_new_format[i][0]).getTime();
          // var formatted = Highcharts.dateFormat('%H:%M:%S.%L', time_);
          data_new.push([time_, data_new_format[i][1]])
        }
        console.log(data_new);
        let temp = {
          name: key,
          data: data_new,
          tooltip: {
            valueDecimals: 2
          }
        }
        stock_data.push(temp)
      }
      console.log(stock_data);
      return stock_data
    }

    $('.chosen-select').chosen({
      width: "100%"
    });

    $(".select2_wells").select2({
      data: select2_options
    });
    $('.select2_wells').val('Rohini Khola'); // Select the option with a value of '1'
    $('.select2_wells').trigger('change');

    $('.select2_wells').on('select2:select', function (e) {
        var data = e.params.data;
        console.log(data);
        console.log($('.select2_wells').val());
        var selected_wells =
        $.ajax({
          url:'/waterapp/call-waterflow-chart-data',
          data:{
            wells: JSON.stringify($('.select2_wells').val())
          },
          success: function(data, status){
              console.log('krishna');
              console.log(data);
              // multilineData(data);
              $("#container").empty();
              Highcharts.stockChart('container', drawStockChart(multilineData(data)));
          },
          error: function(XMLHttpRequest, textStatus, errorThrown) {
            console.log(errorThrown);
              console.log('kafle');
          }
        })
    });
    $('.select2_wells').on('select2:unselect', function (e) {
        var data = e.params.data;
        console.log(data);
        console.log($('.select2_wells').val());
    });



    $(".select2_wells_offline").select2({
      data: select2_options_offline
    });
    // $('.select2_wells').val(null).trigger('change');

    $('.i-checks').iCheck({
      checkboxClass: 'icheckbox_square-green',
      radioClass: 'iradio_square-green',
    });


    $('.district').on('ifChanged', function(event){
      var checked_box = []
      $('.district:checkbox:checked').each(function(){
        checked_box.push($(this).val())
      });

      if (checked_box.length>1) {
        $('.select2_wells').empty().trigger('change');
        $(".select2_wells").select2({
          data: select2_options
        });
      } else{
        let options = filterwellsByDistrict(checked_box[0], select2_options)
        $('.select2_wells').empty().trigger('change');
        $(".select2_wells").select2({
          data: options
        });
        // $('.select2_wells').trigger('change');
      }
      console.log(checked_box);
    });
    $('.well_type').on('ifChanged', function(){
      var checked_box = []
      $('.well_type:checkbox:checked').each(function(){
        checked_box.push($(this).val())
      })
      console.log(checked_box);
    });





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

    var overlays = {
      "Wells": wellsLayer
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


    // Chart creation steps
    Highcharts.getJSON('https://demo-live-data.highcharts.com/aapl-c.json', function(data) {
      // Create the chart
      var data_send = [{
        name: 'flow',
        data: data,
        tooltip: {
          valueDecimals: 2
        }
      }]
      Highcharts.stockChart('container', drawStockChart(data_send));

    });
    let loggerChartContent = drawLineChart('data');
    Highcharts.chart('containerLogger', loggerChartContent);


  });
