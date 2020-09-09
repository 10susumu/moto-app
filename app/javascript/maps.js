function initMap() {

  let map
  let geocoder
  const display = document.getElementById('display')
  let locations = display.textContent.replace( "(" , "" ).replace( ")" , "" )
  let index = locations.indexOf(",")
  let lat = parseFloat(locations.substring(0, index).trim())
  let lng = parseFloat(locations.slice(index + 1).trim())

  geocoder = new google.maps.Geocoder()
  map = new google.maps.Map(document.getElementById('map'), {
    center: {lat:lat, lng:lng},
    zoom: 12,
  });
  
  document.getElementById("code-address").onclick = () => {
    
    let inputAddress = document.getElementById('address').value;
    
    geocoder.geocode( { 'address': inputAddress}, function(results, status) {
      if (status == 'OK') {
        map.setCenter(results[0].geometry.location);
        let marker = new google.maps.Marker({
          map: map,
          position: results[0].geometry.location,
          draggable: true
        });
        display.textContent = "検索結果：" + results[ 0 ].geometry.location
        
        const addmap = document.getElementById("addmap");
        if (!addmap) {
          const renderDom = document.getElementById("form-signin");
          const mapObj = `<input value="" type="hidden" name="content[map]" id="addmap">`;
          renderDom.insertAdjacentHTML("beforeend", mapObj);
          document.getElementById("addmap").setAttribute("value", results[ 0 ].geometry.location)
        } else {
          document.getElementById("addmap").removeAttribute("value")
          document.getElementById("addmap").setAttribute("value", results[ 0 ].geometry.location)
        }
      } else {
        display.textContent = "該当する結果なし:" + status
      }
    });   
  }
}
window.addEventListener("load", initMap)