$(document).ready(function() {
  	if ($("div#map-canvas")) {
  		initMap();
  		marker = new google.maps.Marker({
                    position: new google.maps.LatLng(coordinates.lat, coordinates.lng),
                    map: map,
                    title: 'WORK'
                });
  		logAddress();
  		geolocations();
  	}
})

var coordinates = {lat: 37.78, lng: -122.44}
var map;
var marker;
var address;

function logAddress() {
	var add = $('#logAddress div');
	console.log(add.attr("id"))
	address = add.attr("id").split(" ").join("+");
}

function geolocations() {
	$.get("https://maps.googleapis.com/maps/api/geocode/json?address=" + 
	address + "&key=AIzaSyAeBs3vx7LfuQg8Mj8tEqZ5WvgcwT4DElQ"
		).done(function(data) {
			if (data.results[0]) {
				console.log(data.results[0].geometry.location)
			} else {
				console.log("No Address")
			}
		})		
}

function initMap() {
  		map = new google.maps.Map(document.getElementById('map-canvas'), {
    	center: coordinates,
    	zoom: 8
  		});
}


