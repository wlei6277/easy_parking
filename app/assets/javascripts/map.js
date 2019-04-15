function initMap() { 
  // declare a javascript variable for the parking locations made available through the controller and the gon gem
  var locations = gon.data;
  // instantiate a Google map centered around the first parking spot
  var map = new google.maps.Map(document.getElementById('map'), {
    zoom: 10,
    center: new google.maps.LatLng(locations[0][0], locations[0][1]),
    mapTypeId: google.maps.MapTypeId.ROADMAP
  });
  var infowindow = new google.maps.InfoWindow();
  // loop through the parking locations in the array placing a marker with a label of the number of available parking space
  // and an event window with the address of that parking space 
  var marker, i;
  for (i = 0; i < locations.length; i++) {
    console.log(i)
    marker = new google.maps.Marker({
      position: new google.maps.LatLng(locations[i][0], locations[i][1]),
      label: locations[i][2].toString(),
      map: map
    });
    google.maps.event.addListener(marker, 'click', (function (marker, i) {
      return function () {
        infowindow.setContent(locations[i][3].toString());
        infowindow.open(map, marker);
      };
    })(marker, i));
  }
  // use the Geomarker package to show the uers current location
  var GeoMarker = new GeolocationMarker(map);
  // allow the user to get directions to parking spot by right clicking on a marker
  // function to display the route
}