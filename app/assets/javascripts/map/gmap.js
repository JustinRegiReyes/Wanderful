$(document).ready(function() {
  	if ($("div#map-canvas")) {
  		initMap();
  		logAddress();
  		geolocations();
  	}
})

var city;
var map;
var marker;
var address;
var addressArr = [];

function logAddress() {
	var addresses = $('div.panel-body span');
	for(i = 0; i < addresses.length; i++) {
		addressArr.push(addresses[i].id)
	}
	// if (!!add) {
	// 	address = add.attr("id").split(" ").join("+");
	// } else {
	// 	address = "vallejo ca";
	// }
	console.log(addressArr)
	
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
	for(i = 0; i < addressArr.length; i++) {
		marker = new google.maps.Marker({
                    position: new google.maps.LatLng(coordinates.lat, coordinates.lng),
                    map: map,
                    title: 'WORK'
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


