let map;
let barangays = [];
let tsunamis = [];
let evacuations = [];
let floods = [];
let storm_surges = [];

function initMap() {
  const mapContainer = document.getElementById("map");
  if (mapContainer) {
    map = new google.maps.Map(mapContainer, {
      center: { lat: 16.019097656537834, lng: 120.23156633657322 },
      zoom: 13,
    });
    initMapData();
  }
}

const initMapData = async () => {
  await fetchAllBarangays();
  await fetchAllTsunamis();
  await fetchAllEvacuation();
  await fetchAllFloods();
  await fetchAllStormSurges();
  await displayData();
};

const fetchAllBarangays = () => {
  console.log("fetching barangays");
  return fetch("/api/v2/map_data/barangay")
    .then((res) => {
      console.log({ res });
      return res.json();
    })

    .then((res) => {
      console.log("displaying barangay", res);
      barangays = res;
    })
    .catch((err) => {
      console.log({ err });
    });
};

const fetchAllTsunamis = () => {
  console.log("fetching tsunamis");
  return fetch("/api/v2/map_data/tsunami")
    .then((res) => {
      console.log({ res });
      return res.json();
    })

    .then((res) => {
      console.log("displaying tsunami", res);
      tsunamis = res;
    })
    .catch((err) => {
      console.log({ err });
    });
};

const fetchAllFloods = () => {
  console.log("fetching floods");
  return fetch("/api/v2/map_data/flood")
    .then((res) => {
      console.log({ res });
      return res.json();
    })

    .then((res) => {
      console.log("displaying flood", res);
      floods = res;
    })
    .catch((err) => {
      console.log({ err });
    });
};

const fetchAllStormSurges = () => {
  console.log("fetching storm_surges");
  return fetch("/api/v2/map_data/storm_surge")
    .then((res) => {
      console.log({ res });
      return res.json();
    })

    .then((res) => {
      console.log("displaying storm_surge", res);
      storm_surges = res;
    })
    .catch((err) => {
      console.log({ err });
    });
};

const fetchAllEvacuation = () => {
  console.log("fetching evacuations");
  return fetch("/api/v2/map_data/evacuation")
    .then((res) => {
      console.log({ res });
      return res.json();
    })

    .then((res) => {
      console.log("displaying evacuation", res);
      evacuations = res;
    })
    .catch((err) => {
      console.log({ err });
    });
};

const displayData = () => {
  barangays.map((item) => {
    const content = `${item.name} | ${item.flood_level_status}`;
    if (item.latlong) {
      const icon = {
        url: "/images/barangay-icon.png",
        scaledSize: new google.maps.Size(36, 36),
      };
      displayMarker(item.latlong, content, icon);
    }
  });
  evacuations.map((item) => {
    const content = `${item.name}`;
    if (item.latlong) {
      const icon = {
        url: "/images/Evacuation.png",
        scaledSize: new google.maps.Size(60, 60),
      };
      displayMarker(item.latlong, content, icon);
    }
  });

  tsunamis.map((item) => {
    const content = `Tsunami area | ${item.risk_level}`;
    if (item.latlong) {
      let imageUrl = "/images/Tsunami-Low.png";
      switch (item.risk_level) {
        case "MEDIUM RISK":
          imageUrl = "/images/Tsunami-Medium.png";
          break;
        case "HIGH RISK":
          imageUrl = "/images/Tsunami-High.png";
          break;
      }
      const icon = {
        url: imageUrl,
        scaledSize: new google.maps.Size(36, 36),
      };
      displayMarker(item.latlong, content, icon);
    }
  });

  floods.map((item) => {
    const content = `Flood area | ${item.risk_level}`;
    if (item.latlong) {
      let imageUrl = "/images/flood-low-risk.png";
      switch (item.risk_level) {
        case "MEDIUM RISK":
          imageUrl = "/images/flood-medium-risk.png";
          break;
        case "HIGH RISK":
          imageUrl = "/images/flood-high-risk.png";
          break;
      }
      const icon = {
        url: imageUrl,
        scaledSize: new google.maps.Size(60, 60),
      };
      displayMarker(item.latlong, content, icon);
    }
  });

  storm_surges.map((item) => {
    const content = `Storm Surge area | ${item.risk_level}`;
    if (item.latlong) {
      let imageUrl = "/images/storm_surge-low-risk.png";
      switch (item.risk_level) {
        case "MEDIUM RISK":
          imageUrl = "/images/storm_surge-medium-risk.png";
          break;
        case "HIGH RISK":
          imageUrl = "/images/storm_surge-high-risk.png";
          break;
      }
      const icon = {
        url: imageUrl,
        scaledSize: new google.maps.Size(60, 60),
      };
      displayMarker(item.latlong, content, icon);
    }
  });
};

const displayMarker = (latlong, content, icon) => {
  const position = {
    lat: parseFloat(latlong.split(",")[0]),
    lng: parseFloat(latlong.split(",")[1]),
  };
  const marker = new google.maps.Marker({
    position,
    map,
    icon,
  });
  const infoWindow = new google.maps.InfoWindow();

  marker.addListener("click", () => {
    infoWindow.close();
    infoWindow.setContent(content);
    infoWindow.open(marker.getMap(), marker);
  });
};
