<div class="tab-pane active" id="panel-1">
	<p>
	<div class="input-group">
		<span class="input-group-addon">Filter</span> <input id="filter1"
			type="text" class="form-control" placeholder="Type here...">
	</div>
	<table class="table table-striped table-hover">
		<thead>
			<tr>
				<th>DTC</th>
				<th>Date</th>
				<th>Level</th>
				<th>Type</th>
				<th>Description</th>
				<th>Status</th>
				<th>Customer</th>
				<th>Vehicle</th>
				<th>Location</th>
			</tr>
		</thead>
		<tbody ID="searchable1">
			<c:forEach items="${vehicleFaults}" var="vehicleFault">
				<tr class='${vehicleFault.dtc.dtcCssClass}'>
					<td>${vehicleFault.dtc.dtc}</td>
					<td>${vehicleFault.dateTime}</td>
					<td>${vehicleFault.level}</td>
					<td>${vehicleFault.type}</td>
					<td>${vehicleFault.details}</td>
					<td>${vehicleFault.dtcStatus}</td>
					<td class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown">
							${vehicleFault.device.vehicle.customer.firstName}
							${vehicleFault.device.vehicle.customer.lastName}</a>
						<ul class="dropdown-menu">
							<li><a>${vehicleFault.device.vehicle.customer.phone}</a></li>
							<li class="divider"></li>
							<li><a>${vehicleFault.device.vehicle.customer.email}</a></li>
						</ul></td>
					<td>${vehicleFault.device.vehicle.manufacturer}
						${vehicleFault.device.vehicle.model}</td>
					<td
						onclick="showLocation(${vehicleFault.location.lat},${vehicleFault.location.lon})"><input
						src="img/location.png" type="image" data-toggle="modal"
						data-target=".bs-example-modal-lg" width="50" height="25"></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	</p>
</div>
<div class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog"
	aria-labelledby="myLargeModalLabel" aria-hidden="true" id="myModal">
	<div class="modal-dialog modal-lg">
		<div class="modal-content" id="contact-modal">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">×</button>
				<h3></h3>
			</div>
			<div class="modal-body">
				<div id="map-canvas" style="width: 500px; height: 400px"></div>
			</div>
		</div>
	</div>
</div>


<script>
	function showLocation(lat,lon){
		var myLatlng = new google.maps.LatLng(lat, lon);
		var mapOptions = {
			zoom : 14,
			center : myLatlng
		}
		var map = new google.maps.Map(document
				.getElementById('map-canvas'), mapOptions);

		var marker = new google.maps.Marker({
			position : myLatlng,
			map : map,
			title : 'Vehicle Location'
		});
		
		$("#myModal").on(
				"shown.bs.modal",
				function() {
					google.maps.event.trigger(map, "resize");
					map.setCenter(new google.maps.LatLng(lat,
							lon));
				});
	}
	
	google.maps.event.addDomListener(window, 'load', showLocation);
</script>