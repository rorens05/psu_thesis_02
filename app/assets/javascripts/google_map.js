let map;
let barangays = [];
function initMap() {
  const mapContainer = document.getElementById("map")
  if(mapContainer) {
    map = new google.maps.Map(mapContainer, {
      center: { lat: 16.019097656537834, lng: 120.23156633657322 },
      zoom: 13,
    });
    initMapData()
  }
}

const initMapData = async() => {
  await fetchAllBarangays()
  await displayData()
}

const displayData = () => {
  barangays.map(item => {
    const content = `${item.name} | ${item.flood_level_status}`
    if(item.latlong){
      const icon = {
        url: '/images/barangay.png',
        scaledSize: new google.maps.Size(36,36)
      }
      displayMarker(item.latlong, content, icon)
    }
  })
}

const fetchAllBarangays = () => {
  console.log("fetching barangays")
  return fetch('/api/v2/map_data/barangay')
    .then(res => {
      console.log({res})
      return res.json()
    })

    .then(res => {
      console.log("displaying barangay", res)
      barangays = res
      
    })
    .catch(err => {
      console.log({err})
    })
}

const displayMarker = (latlong, content, icon) =>{
  const position = {
    lat: parseFloat(latlong.split(",")[0]),
    lng: parseFloat(latlong.split(",")[1]) 
  }
  const marker = new google.maps.Marker({
    position,
    map,
    icon
  });
  const infoWindow = new google.maps.InfoWindow();

  marker.addListener("click", () => {
    infoWindow.close();
    infoWindow.setContent(content);
    infoWindow.open(marker.getMap(), marker);
  });
}