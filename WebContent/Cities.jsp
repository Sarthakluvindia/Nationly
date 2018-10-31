<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  	<meta name="viewport" content="initial-scale=1.0, user-scalable=no">
    <meta charset="utf-8">
    <title>Cities | Nationly by Sarthak Agarwal</title>
    <style>
      /* Always set the map height explicitly to define the size of the div
       * element that contains the map. */
      #map {
        height: 100%;
      }
      /* Optional: Makes the sample page fill the window. */
      html, body {
        height: 100%;
        margin: 0;
        padding: 0;
      }
      #description {
        font-family: Roboto;
        font-size: 15px;
        font-weight: 300;
      }

      #infowindow-content .title {
        font-weight: bold;
      }

      #infowindow-content {
        display: none;
      }

      #map #infowindow-content {
        display: inline;
      }

		.controls {
        margin-top: 10px;
        border: 1px solid transparent;
        border-radius: 2px 0 0 2px;
        box-sizing: border-box;
        -moz-box-sizing: border-box;
        height: 32px;
        outline: none;
        box-shadow: 0 2px 6px rgba(0, 0, 0, 0.3);
      }
      
      #origin-input,
      #destination-input {
        background-color: #fff;
        font-family: Roboto;
        font-size: 15px;
        font-weight: 300;
        margin-left: 12px;
        padding: 0 11px 0 13px;
        text-overflow: ellipsis;
        width: 200px;
      }

      #origin-input:focus,
      #destination-input:focus {
        border-color: #4d90fe;
      }

      #mode-selector {
        color: #fff;
        background-color: #4d90fe;
        margin-left: 12px;
        padding: 5px 11px 0px 11px;
      }

      #mode-selector label {
        font-family: Roboto;
        font-size: 13px;
        font-weight: 300;
      }
      
    </style>
</head>
<body>
<%
	String city = request.getParameter("city");
	int click = 0;
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=(Connection) DriverManager.getConnection("jdbc:mysql://localhost/nationly?user=root&password=Sarthak@124");
	String retquery="select clicks from pop where name='"+city+"'";
	PreparedStatement retst=con.prepareStatement(retquery);
	ResultSet rs=retst.executeQuery();
	while(rs.next()){
		click = rs.getInt(1);
	}
	int update = click+1;
	String query="update pop set clicks='"+update+"' where name='"+city+"'";
	PreparedStatement st=con.prepareStatement(query);
	st.executeUpdate();
%>
<input id="origin-input" class="controls" type="text"
        placeholder="Enter an origin location">

    <input id="destination-input" class="controls" type="text"
        placeholder="Enter a destination location">

    <div id="mode-selector" class="controls">
      <input type="radio" name="type" id="changemode-walking" checked="checked">
      <label for="changemode-walking">Walking</label>

      <input type="radio" name="type" id="changemode-transit">
      <label for="changemode-transit">Transit</label>

      <input type="radio" name="type" id="changemode-driving">
      <label for="changemode-driving">Driving</label>
    </div>
    <div id="map"></div>
    <script>
var pyrmont;
var map;
      function initAutocomplete() {
        var geocoder =  new google.maps.Geocoder();
        geocoder.geocode( { 'address': '<%=city%>'}, function(results, status) {
              if (status == google.maps.GeocoderStatus.OK) {
            	  pyrmont = {lat:results[0].geometry.location.lat() , lng: results[0].geometry.location.lng()};
                //alert("location : " + results[0].geometry.location.lat() + " " +results[0].geometry.location.lng());
                 map = new google.maps.Map(document.getElementById('map'), {
                    center: {lat: results[0].geometry.location.lat(), lng: results[0].geometry.location.lng()},
                    zoom: 16,
                    mapTypeId: 'roadmap'
                  });
                new AutocompleteDirectionsHandler(map);
                
                infowindow = new google.maps.InfoWindow();
                var service = new google.maps.places.PlacesService(map);
                service.nearbySearch({
                  location: pyrmont,
                  radius: 500,
                  type: ['amusement_park','art_gallery','casino','church','hindu_temple','zoo','shopping_mall','park','mosque','museum','establishment']
                }, callback);
                
              } else {
                alert("Something got wrong " + status);
              }
            });
        
      }
      
      function AutocompleteDirectionsHandler(map) {
    	  var options = {
    		types: ['(cities)'],
    		componentRestrictions: {country: 'in'}
    	  };
    	  var infowindow;
          this.map = map;
          this.originPlaceId = null;
          this.destinationPlaceId = null;
          this.travelMode = 'WALKING';
          var originInput = document.getElementById('origin-input');
          var destinationInput = document.getElementById('destination-input');
          var modeSelector = document.getElementById('mode-selector');
          this.directionsService = new google.maps.DirectionsService;
          this.directionsDisplay = new google.maps.DirectionsRenderer;
          this.directionsDisplay.setMap(map);

          var originAutocomplete = new google.maps.places.Autocomplete(
              originInput, options);
          var destinationAutocomplete = new google.maps.places.Autocomplete(
              destinationInput, options);

          this.setupClickListener('changemode-walking', 'WALKING');
          this.setupClickListener('changemode-transit', 'TRANSIT');
          this.setupClickListener('changemode-driving', 'DRIVING');

          this.setupPlaceChangedListener(originAutocomplete, 'ORIG');
          this.setupPlaceChangedListener(destinationAutocomplete, 'DEST');

          this.map.controls[google.maps.ControlPosition.TOP_LEFT].push(originInput);
          this.map.controls[google.maps.ControlPosition.TOP_LEFT].push(destinationInput);
          this.map.controls[google.maps.ControlPosition.TOP_LEFT].push(modeSelector);
        
          
        }

        function callback(results, status) {
          if (status === google.maps.places.PlacesServiceStatus.OK) {
            for (var i = 0; i < results.length; i++) {
              createMarker(results[i]);
            }
          }
        }

        function createMarker(place) {
          var placeLoc = place.geometry.location;
          var marker = new google.maps.Marker({
            map: map,
            position: place.geometry.location
          });

          google.maps.event.addListener(marker, 'click', function() {
            infowindow.setContent(place.name);
            infowindow.open(map, this);
          });
      }

        // Sets a listener on a radio button to change the filter type on Places
        // Autocomplete.
        AutocompleteDirectionsHandler.prototype.setupClickListener = function(id, mode) {
          var radioButton = document.getElementById(id);
          var me = this;
          radioButton.addEventListener('click', function() {
            me.travelMode = mode;
            me.route();
          });
        };

        AutocompleteDirectionsHandler.prototype.setupPlaceChangedListener = function(autocomplete, mode) {
          var me = this;
          autocomplete.bindTo('bounds', this.map);
          autocomplete.addListener('place_changed', function() {
            var place = autocomplete.getPlace();
            if (!place.place_id) {
              window.alert("Please select an option from the dropdown list.");
              return;
            }
            if (mode === 'ORIG') {
              me.originPlaceId = place.place_id;
            } else {
              me.destinationPlaceId = place.place_id;
            }
            me.route();
          });

        };

        AutocompleteDirectionsHandler.prototype.route = function() {
          if (!this.originPlaceId || !this.destinationPlaceId) {
            return;
          }
          var me = this;

          this.directionsService.route({
            origin: {'placeId': this.originPlaceId},
            destination: {'placeId': this.destinationPlaceId},
            travelMode: this.travelMode
          }, function(response, status) {
            if (status === 'OK') {
              me.directionsDisplay.setDirections(response);
            } else {
              window.alert('Directions request failed due to ' + status);
            }
          });
        };
        

    </script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDmlPcru4WhuQF5qOqz_2tooy7z6ASo1Q4&libraries=places&callback=initAutocomplete"
         async defer></script>
         </body>
</html>