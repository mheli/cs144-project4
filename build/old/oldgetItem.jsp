<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<link rel="stylesheet" type="text/css" href="css/itemdetail.css">
   <meta charset="UTF-8">
	<meta name="viewport" content="initial-scale=1.0, user-scalable=no" /> 
	<script type="text/javascript" 
    src="http://maps.google.com/maps/api/js?"> 
	</script> 
	<script type="text/javascript"> 
	    function showBids() {
    		oBidTable = document.getElementById("bidtable");
    		if (oBidTable.style.visibility != "visible")
	    		oBidTable.style.visibility = "visible";
	    	else
	    		oBidTable.style.visibility = "hidden";
	    }
	</script>
	<script type="text/javascript">
		function loadMap(){
			//dummy function
		}
	</script>
</head>
<body onload="loadMap()">
<c:choose>
	<c:when test="${not empty item}">
		<div class="container">
			<div class="itemlookup">
			    <form action="item" accept-charset="utf-8">
				    <input type="text" name="id">
				    <input type="submit" value="Item Lookup">
			    </form>
			</div>
		    <div class="important">
				<h1>${item.name} (${item.itemID})</h1>
				<div class="prices">
					<p>Started: ${item.started}</p>
					<p>Ends: ${item.ends}</p>
					<c:choose>
						<c:when test="${item.numberOfBids eq '0'}">
							<p>Starting bid: ${item.currently}</p>
						</c:when>
						<c:otherwise>
							<p>Current bid: ${item.currently}</p>
						</c:otherwise>
					</c:choose>
					<c:if test="${not empty item.buyPrice}">
						<p>Buy price: ${item.buyPrice}</p>
					</c:if>
					<p id="showbids"><a href="javascript:void(0)" onclick="showBids();">${item.numberOfBids} bids</a></p>
					<c:choose>
						<c:when test="${item.numberOfBids eq '0'}">
						</c:when>
						<c:otherwise>
							<table id="bidtable">
								<tr>
									<td>Time</td>
									<td>Amount</td>
									<td>Bidder</td>
								</tr>
								<c:forEach items="${item.bids}" var="bid">
										<tr>
											<td>${bid.time}</td>
											<td>${bid.amount}</td>
											<td>${bid.bidderUID} (${bid.rating})</td>
										</tr>
								</c:forEach>
							</table>
						</c:otherwise>		
					</c:choose>
				</div>
				<div class="seller">
					<h2>Seller information</h2>
					<p>${item.seller} (${item.sellerRating})</p>		
				</div>
		    </div>

		    <div class="misc">
		    	<h2>Item information</h2>
				<table>
					<tr>
					<td class="firstCol">Categories:</td>
					<c:forEach items="${item.categories}" var="category">
						<td>${category}</td>
					</c:forEach>
					</tr>
				</table>
				<c:choose>
					<c:when test="${not empty item.description}">
						<p>${item.description}</p>
					</c:when>
					<c:otherwise>
						<p>No description.</p>
					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${not empty item.latitude}">
						<p>Location: ${item.location} (${item.latitude}, ${item.longitude})</p>
						<p>Country: ${item.country}</p>
						<script type="text/javascript">
						function loadMap() {
						    var latlng = new google.maps.LatLng(${item.latitude},${item.longitude}); 	  		
						    var myOptions = { 
						      zoom: 14, // default is 8  
						      center: latlng, 
						      mapTypeId: google.maps.MapTypeId.ROADMAP 
						    }; 
						    var map = new google.maps.Map(document.getElementById("map_canvas"),
						        myOptions); 
						    var marker = new google.maps.Marker({
						    	position: latlng,
						    	map: map,
						    });
						}
						</script> 
					</c:when>
					<c:otherwise>
						<p>Location: ${item.location}</p>
						<p>Country: ${item.country}</p>
						<script type="text/javascript">
						function loadMap() {
					  		var latlng = new google.maps.LatLng("34.0621361","-118.4463541");
						    var myOptions = { 
						      zoom: 0, // default is 8  
						      center: latlng, 
						      mapTypeId: google.maps.MapTypeId.ROADMAP 
						    }; 
						    var map = new google.maps.Map(document.getElementById("map_canvas"),
						        myOptions); 						
						}
						</script>	
					</c:otherwise>
				</c:choose>
				<div id="map_canvas"></div>
		    </div>

		</div>
	</c:when>
	<c:otherwise>
		<h1>No item found for id "${param.id}"</h1>
	</c:otherwise>
</c:choose>
</body>
</html>