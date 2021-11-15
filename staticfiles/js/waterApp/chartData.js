const multilineData = (data) => {
  let kk = [{
    name: 'Water-Level',
    data: data,
    tooltip: {
      valueDecimals: 2
    }
  }];
  let stock_data = [];
  for (let key of Object.keys(data)) {
    let data_new_format = data[key]['data']
    let data_new = [];
    for (i = 0; i < data_new_format.length; i = i + 1) {
      let time_ = new Date(data_new_format[i][0]).getTime();
      data_new.push([time_, data_new_format[i][1]])
    }
    let temp = {
      name: key,
      data: data_new,
      // marker: {
      //   enabled: true,
      //   radius: 3
      // },
      // type: 'spline',
      shadow: true,
      tooltip: {
        valueDecimals: 2
      }
    }
    stock_data.push(temp)
  }
  return stock_data
};
