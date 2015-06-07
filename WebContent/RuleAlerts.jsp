<div class="tab-pane" id="panel-3">
	<p>
	<div class="input-group">
		<span class="input-group-addon">Filter</span> <input id="filter3"
			type="text" class="form-control" placeholder="Type here...">
	</div>
	<div class="panel-group" id="panel-447438">
	<br>
		<c:forEach items="${ruleConditions}" var="ruleCondition">
			<div class="panel panel-default">
				<div class="panel-heading">
					<a class="panel-title collapsed" data-toggle="collapse"
						data-parent="#parent${ruleCondition.rule.ruleId}"
						href="#rule${ruleCondition.rule.ruleId}">
						${ruleCondition.ruleNaturalLanguage}</a>
				</div>
				<div id="rule${ruleCondition.rule.ruleId}"
					class="panel-collapse collapse">
					<div class="panel-body">
						<table class="table table-striped table-hover">
							<thead>
								<tr>
									<th>Time</th>
									<th>Vehicle</th>
									<th>Customer</th>
									<th>Parameter</th>
									<th>Value</th>
								</tr>
							</thead>
							<tbody ID="searchable3">
								<c:forEach items="${ruleCondition.ruleAlerts}" var="ruleAlert">
									<tr>
										<td>${ruleAlert.pidData.time}</td>
										<td>${ruleAlert.pidData.device.vehicle.manufacturer} - ${ruleAlert.pidData.device.vehicle.model}</td>
										<td>${ruleAlert.pidData.device.vehicle.customer.firstName} - ${ruleAlert.pidData.device.vehicle.customer.lastName}</td>
										<td>${ruleAlert.pidData.parameter.parameterName}</td>
										<td>${ruleAlert.pidData.value}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>
	</p>
</div>