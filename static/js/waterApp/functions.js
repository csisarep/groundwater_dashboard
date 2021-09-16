const filterwellsByDistrict = (district, data) => {
  console.log(data, district);
  let result = data.filter((item) => {
    return item.district === district;
  });
  // console.log(result);
  return result
}
