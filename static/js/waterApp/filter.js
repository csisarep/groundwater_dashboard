const filterGeojson = (featuresList, district, wells) => {
  let filtredResults = [];
  district.forEach(function(item) {
    let filterValue = featuresList.filter(v => v.properties.district === item);
    filtredResults = filtredResults.concat(filterValue);
  })
  let filtered = [];
  wells.forEach((item, i) => {
    let filterValue = filtredResults.filter(v => v.properties.type_id === item);
    filtered = filtered.concat(filterValue);
  });
  return filtered
}

const filterwellsByDistrict = (district, data) => {

  let filtredResults = [];
  district.forEach(function(item) {
    let filterValue = data.filter(v => v.district === item);
    filtredResults = filtredResults.concat(filterValue);
  })
  // console.log(result);
  return filtredResults
}
