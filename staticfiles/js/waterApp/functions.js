

const ajaxODKdata = () => {
  $.ajax({
    url: '/waterapp/call-waterflow-chart-data',
    data: {
      wells: JSON.stringify($('.select2_wells').val())
    },
    success: function(data, status) {
      // multilineData(data);
      $("#container").empty();
      Highcharts.stockChart('container', drawStockChart(multilineData(data)));
    },
    error: function(XMLHttpRequest, textStatus, errorThrown) {

    }
  })

};

const ajaxOfflineLoggerdata = () => {
  $.ajax({
    url: '/waterapp/call-waterflow-offline-logger-chart-data',
    data: {
      wells: JSON.stringify($('.select2_wells_offline').val())
    },
    success: function(data, status) {
      console.log(data);
      // multilineData(data);
      $("#containerLogger").empty();
      Highcharts.stockChart('containerLogger', drawStockChart(multilineData(data)));
    },
    error: function(XMLHttpRequest, textStatus, errorThrown) {
    }
  })

};

const ajaxHistoricaldata = () => {
  $.ajax({
    url: '/waterapp/call-waterflow-historical-chart-data',
    data: {
      wells: JSON.stringify($('.select2_wells').val())
    },
    success: function(data, status) {
      // multilineData(data);
      $("#container").empty();
      Highcharts.stockChart('container', drawStockChart(multilineData(data)));
    },
    error: function(XMLHttpRequest, textStatus, errorThrown) {

    }
  })

};
