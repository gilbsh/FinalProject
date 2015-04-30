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
					<td>${vehicleFault.device.vehicle.customer.firstName}
						${vehicleFault.device.vehicle.customer.lastName}</td>
					<td>${vehicleFault.device.vehicle.manufacturer}
						${vehicleFault.device.vehicle.model}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	</p>
</div>