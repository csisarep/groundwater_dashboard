const exportContextMenu = {
  buttons: {
    contextButton: {
      menuItems: [{
        textKey: 'downloadPNG',
        onclick: function() {
          this.exportChart();
        }
      }, {
        textKey: 'downloadJPEG',
        onclick: function() {
          this.exportChart({
            type: 'image/jpeg'
          });
        }
      }, {
        textKey: 'downloadPDF',
        onclick: function() {
          this.exportChart({
            type: 'image/pdf'
          });
        }
      }, {
        textKey: 'downloadCSV',
        onclick: function() {
          this.downloadCSV();
        }
      }]
    }
  }
}
// ES6
const drawStockChart = (data) => {
  let variable_return = {
    chart: {
      borderColor: '#83D0C0',
      backgroundColor: '#F3F3F4',
      borderWidth: 2,
      type: 'line'
    },
    rangeSelector: {
      selected: 1
    },

    title: {
      text: 'Water Flow chart- sample'
    },

    series: data,
    credits: {
      enabled: false
    },
    // colors: ['#80CDBD', '#EDEDED', '#DEDEDE', '#DDDF00', '#24CBE5', '#64E572', '#FF9655', '#FFF263', '#6AF9C4'],
    exporting: exportContextMenu
  };
  return variable_return
};

const drawLineChart = (data) => {
  let variable_return = {
    chart: {
      borderColor: '#83D0C0',
      backgroundColor: '#F3F3F4',
      borderWidth: 2,
      type: 'line'
    },
    title: {
      text: 'Solar Employment Growth by Sector, 2010-2016'
    },

    subtitle: {
      text: 'Source: thesolarfoundation.com'
    },

    yAxis: {
      title: {
        text: 'Number of Employees'
      }
    },

    xAxis: {
      accessibility: {
        rangeDescription: 'Range: 2010 to 2017'
      }
    },

    legend: {
      layout: 'vertical',
      align: 'right',
      verticalAlign: 'middle'
    },

    plotOptions: {
      series: {
        label: {
          connectorAllowed: false
        },
        pointStart: 2010
      }
    },

    series: [{
      name: 'Installation',
      data: [43934, 52503, 57177, 69658, 97031, 119931, 137133, 154175]
    }, {
      name: 'Manufacturing',
      data: [24916, 24064, 29742, 29851, 32490, 30282, 38121, 40434]
    }, {
      name: 'Sales & Distribution',
      data: [11744, 17722, 16005, 19771, 20185, 24377, 32147, 39387]
    }, {
      name: 'Project Development',
      data: [null, null, 7988, 12169, 15112, 22452, 34400, 34227]
    }, {
      name: 'Other',
      data: [12908, 5948, 8105, 11248, 8989, 11816, 18274, 18111]
    }],

    responsive: {
      rules: [{
        condition: {
          maxWidth: 500
        },
        chartOptions: {
          legend: {
            layout: 'horizontal',
            align: 'center',
            verticalAlign: 'bottom'
          }
        }
      }]
    },
    credits: {
      enabled: false
    },
    colors: ['#80CDBD', '#DEDEDE', '#DDDF00', '#24CBE5', '#64E572', '#FF9655', '#FFF263', '#6AF9C4'],
    exporting: exportContextMenu

  }
  return variable_return
};
