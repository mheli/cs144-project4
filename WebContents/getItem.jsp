<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<link rel="stylesheet" type="text/css" href="css/itemdetail.css">
	<meta name="viewport" content="initial-scale=1.0, user-scalable=no" /> 
	<style type="text/css"> 
	  html { height: 100% } 
	  body { height: 100%;} 
	  #map_canvas { height: 80%; width: 80%; } 
	</style> 
	<script type="text/javascript" 
    src="http://maps.google.com/maps/api/js?"> 
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
	<c:choose>
		<c:when test="${not empty item.description}">
			<p>${item.description}</p>
		</c:when>
		<c:otherwise>
			<p>No description.</p>
		</c:otherwise>
	</c:choose>
	<table>
		<tr>
		<td>Categories:</td>
		<c:forEach items="${item.categories}" var="category">
			<td>${category}</td>
		</c:forEach>
		</tr>
	</table>


	<p>Seller: ${item.seller} Rating: ${item.sellerRating}</p>
	<p>Item ID: ${item.itemID}</p>
	<c:choose>
		<c:when test="${not empty item.latitude}">
			<p>Location: ${item.location} (${item.latitude}, ${item.longitude}) Country: ${item.country}</p>
			<div id="map_canvas"></div>
		</c:when>
		<c:otherwise>
			<p>Location: ${item.location} Country: ${item.country}</p>			
		</c:otherwise>
	</c:choose>

	<p>Started: ${item.started} Ends: ${item.ends}</p>
	<p>Currently: ${item.currently}</p>
	<c:if test="${not empty item.buyPrice}">
		<p>Buy Price: ${item.buyPrice}</p>
	</c:if>
	<c:choose>
		<c:when test="${item.numberOfBids eq '0'}">
			<p>Min Bid: ${item.firstBid}</p>
		</c:when>
		<c:otherwise>
			<p>Bids:</p>
			<table>
				<c:forEach items="${item.bids}" var="bid">
						<tr>
							<td>${bid.time}</td>
							<td>${bid.amount}</td>
							<td>${bid.bidderUID}</td>
							<td>${bid.rating}</td>
						</tr>
				</c:forEach>
			</table>
		</c:otherwise>		
	</c:choose>

</body>
</html>