$(document).ready(function() {
  	initMap();
  	marker = new google.maps.Marker({
                    position: new google.maps.LatLng(coordinates.lat, coordinates.lng),
                    map: map,
                    title: 'WORK'
                });
  }
)

var coordinates = {lat: 37.78, lng: -122.44}
var map;
var marker;
var address = "Los Francisco California".split(" ").join("+");
$.get("https://maps.googleapis.com/maps/api/geocode/json?address=" + 
	address + "&key=AIzaSyAeBs3vx7LfuQg8Mj8tEqZ5WvgcwT4DElQ"
).done(function(data) {
	console.log(data.results[0].geometry.location)
}
)
	function initMap() {
  		map = new google.maps.Map(document.getElementById('map-canvas'), {
    	center: coordinates,
    	zoom: 8
  		});
  	}

