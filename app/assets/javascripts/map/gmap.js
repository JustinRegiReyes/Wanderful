$(document).ready(function() {
  	if ($("div#map-canvas").length) {
  		initMap();
  		logAddress();
  		geolocations();
  	}
})

var city;
var map;
var address;
var addressArr = [];

function logAddress() {
	var addresses = $('div.panel-body span');
	for(i = 0; i < addresses.length; i++) {
		addressArr.push(addresses[i].id)
	}
}

function geolocations() {
	for(i = 0; i < addressArr.length; i++ ) {
	$.get("https://maps.googleapis.com/maps/api/geocode/json?address=" + 
	addressArr[i] + "&key=AIzaSyAeBs3vx7LfuQg8Mj8tEqZ5WvgcwT4DElQ"
		).done(function(data) {
			if (data.results[0]) {
				var coordinates = data.results[0].geometry.location;
				markers(coordinates)
			} else {
				console.log("No Address")
			}
		})	
	}	
}

function markers(coordinates) {
	infoBubble = new InfoBubble({
      map: map,
      content: '<div class="mylabel"><b>' + 'Tesst' + '</b><br>Once upon a time</div>',
      position: new google.maps.LatLng(-32.0, 149.0),
      shadowStyle: 1,
      padding: 1,
      backgroundColor: '#FFFFFF',
      borderRadius: 0,
      arrowSize: 10,
      borderWidth: 1,
      borderColor: '#FFFFFF',
      disableAutoPan: true,
      hideCloseButton: true,
      arrowPosition: 50,
      backgroundClassName: 'transparent',
      arrowStyle: 2
    });
	for(i = 0; i < addressArr.length; i++) {
		var marker = new google.maps.Marker({
                    position: new google.maps.LatLng(coordinates.lat, coordinates.lng),
                    map: map,
                    title: 'WORK',
                    id: 'test'
                });
		var infowindow = new google.maps.InfoWindow({
    	content: "<h1>Test</h1>"
  		});
		marker.addListener('mouseover', function() {
    	infoBubble.open(map, marker);
  		});
  		marker.addListener('mouseout', function() {
    	infoBubble.close(map, marker);
  		});
	}
}

function initMap() {
		city = $("header h1").attr("id");
		$.get("https://maps.googleapis.com/maps/api/geocode/json?address=" + 
		city + "&key=AIzaSyAeBs3vx7LfuQg8Mj8tEqZ5WvgcwT4DElQ"
		).done(function(data) {
			if (data.results[0]) {
				var centerCoordinates = data.results[0].geometry.location;
			} 
  			map = new google.maps.Map(document.getElementById('map-canvas'), {
    		center: centerCoordinates,
    		zoom: 12
  			});
  		})
}


