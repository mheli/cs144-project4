<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<meta name="viewport" content="initial-scale=1.0, user-scalable=no" /> 
	<style type="text/css"> 
	  html { height: 100% } 
	  body { height: 100%; margin: 0px; padding: 0px } 
	  #map_canvas { height: 80%; width: 80%; } 
	</style> 
	<script type="text/javascript" 
    src="http://maps.google.com/maps/api/js?sensor=false"> 
	</script> 
	<script type="text/javascript"> 
	  function initialize() { 
	    var latlng = new google.maps.LatLng(${item.latitude},${item.longitude}); 
	    var myOptions = { 
	      zoom: 14, // default is 8  
	      center: latlng, 
	      mapTypeId: google.maps.MapTypeId.ROADMAP 
	    }; 
	    var map = new google.maps.Map(document.getElementById("map_canvas"),
	        myOptions); 
	  } 
	</script> 

</head>
<body onload="initialize()">
    <form action="item">
	    <input type="text" name="id">
	    <input type="submit" value="Item Lookup">
    </form>

	<h1>${item.name}</h1>
	<table>
		<c:forEach items="${item.bids}" var="bid">
				<tr>
					<td>${bid.time}</td>
				</tr>
		</c:forEach>
	</table>
	<div id="map_canvas"></div> 
</body>
</html>