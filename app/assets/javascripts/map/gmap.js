$(document).ready(function() {
  	if ($("div#map-canvas").length) {
  		initMap();
  		logInfo();
  	}
})

var city;
var map;
var address;
var addressArr = [];
var geolocations;

function logInfo() {
	var addresses = $('div.panel-body span');
	for(i = 0; i < addresses.length; i++) {
		addressArr.push(addresses[i].id)
	}
}




function bindInfoWindow(marker, map, infowindow, description) {
    google.maps.event.addListener(marker, 'click', function() {
        infowindow.setContent(description);
        infowindow.open(map, marker);
    });
}

function bindInfoBubble(marker, map, infobubble, description) {
    // google.maps.event.addListener(marker, 'click', function() {
    //     infowindow.setContent(description);
    //     infowindow.open(map, marker);
    // });
      
      marker.addListener('mouseout', function() {
        infobubble.close(map, marker);
      });
}

function initMap() {
    var infowindow =  new google.maps.InfoWindow();

		city = $("header h1").attr("id");
		$.get("https://maps.googleapis.com/maps/api/geocode/json?address=" + 
		city + "&key=AIzaSyAeBs3vx7LfuQg8Mj8tEqZ5WvgcwT4DElQ"
		).done(function(data) {
			if (data.results[0]) {
				var centerCoordinates = data.results[0].geometry.location;
			} 
  			var map = new google.maps.Map(document.getElementById('map-canvas'), {
    		center: centerCoordinates,
    		zoom: 12
  			});

        // ====================== Markers ========================== 
        function markers(coordinates, test) {
            // for(i = 0; i < addressArr.length; i++) {
            //   var logTitle = $('div.panel-body p')[i].id
            //   var logContent = $('#' + logTitle).html()
              
              var marker = new google.maps.Marker({
                              position: new google.maps.LatLng(coordinates.lat, coordinates.lng),
                              map: map,
                              title: 'WORK'
                          });
              google.maps.event.addListener(marker, 'click', function() {
                infowindow.setContent(test + 'test');
                infowindow.open(map, marker);
              });

               // var infoBubble = new InfoBubble({
               //    shadowStyle: 1,
               //    padding: 1,
               //    backgroundColor: '#FFFFFF',
               //    borderRadius: 0,
               //    arrowSize: 10,
               //    borderWidth: 1,
               //    borderColor: '#FFFFFF',
               //    disableAutoPan: true,
               //    hideCloseButton: true,
               //    arrowPosition: 50,
               //    backgroundClassName: 'transparent',
               //    arrowStyle: 2
               //  });
                
               //  bindInfoBubble(marker, map, infoBubble, i + 'test');
               // bindInfoWindow(marker, map, infowindow, i +'TEST');
            // }
          }

          geolocations = function() {
              for(i = 0; i < addressArr.length; i++ ) {
                $.get("https://maps.googleapis.com/maps/api/geocode/json?address=" + 
                   addressArr[i] + "&key=AIzaSyAeBs3vx7LfuQg8Mj8tEqZ5WvgcwT4DElQ"
                ).done(function(data) {
                    if (data.results[0]) {
                    var coordinates = data.results[0].geometry.location;
                     markers(coordinates, i)
                    } else {
                        console.log("No Address")
                    }
                })  
              } 
          }
          geolocations();
  		})

}


