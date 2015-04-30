<div class="tab-pane" id="panel-2">
	<p>
	<div class="input-group">
		<span class="input-group-addon">Filter</span> <input id="filter2"
			type="text" class="form-control" placeholder="Type here...">
	</div>
	<table class="table table-striped table-hover">
		<thead>
			<tr>
				<th>Customer</th>
				<th>VehicleId</th>
				<th>Model</th>
				<th>Total Hours</th>
				<th>Hours To Treatment</th>
				<th>Treatment Type</th>
			</tr>
		</thead>
		<tbody ID="searchable2">
			<c:forEach items="${vehiclesMaintenance}" var="vehicleMaintenance">
				<tr class='${vehicleMaintenance.cssClass}'>
					<td>${vehicleMaintenance.customer.firstName}
						${vehicleMaintenance.customer.lastName}</td>
					<td>${vehicleMaintenance.vehicle.vehicleId}</td>
					<td>${vehicleMaintenance.vehicle.manufacturer}
						${vehicleMaintenance.vehicle.model}</td>
					<td>${vehicleMaintenance.totalHours}</td>
					<td>${vehicleMaintenance.hoursLeftForNextTreatment}</td>
					<td>${vehicleMaintenance.treatmentType}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	</p>
</div>