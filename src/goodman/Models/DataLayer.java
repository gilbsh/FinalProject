package goodman.Models;

import java.util.*;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DataLayer {
	String url;
	String userName;
	String password;
	String dataBaseName;
	String connectionString;
	private Connection con;

	public DataLayer(String url, String userName, String password,
			String dataBaseName) {
		this.url = url.toString();
		this.userName = userName.toString();
		this.password = password.toString();
		this.dataBaseName = dataBaseName.toString();
		this.connectionString = new String(url + "/" + dataBaseName);

	}

	public DataLayer() {
		this.url = "jdbc:mysql://finalprojectdb.ctsvfo0gnwiz.us-west-2.rds.amazonaws.com:3306";
		this.userName = "shahar";
		this.dataBaseName = "finalprojectdb";
		this.password = "finalprojectdb";
		this.connectionString = new String(url + "/" + dataBaseName);
	}

	/************************************************************************************
	 * General Methods
	 ************************************************************************************/
	public boolean connect() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection(connectionString, userName,
					password);
			return true;
		} catch (Exception ex) {
			System.out.print("connect - " + ex.getMessage());
			return false;
		}
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public void close() {
		try {
			con.close();
		} catch (Exception ex) {
			System.out.print("Coudln't close connections");
		}
	}

	public void editRow(String tableName, String attributeName, String pk,
			String value, String idColumnName) {
		PreparedStatement preparedStatement = getEditRowStatement(tableName,
				attributeName, pk, value, idColumnName);
		if (preparedStatement != null) {
			try {
				preparedStatement.executeUpdate();
			} catch (Exception ex) {
				System.out.print(ex.getMessage());
			}
		}
	}

	/************************************************************************************
	 * Get Lists of stuff
	 ************************************************************************************/

	public Customer[] getCustomers() {
		try {
			Statement stmt = con.createStatement();
			String query = "SELECT FirstName,LastName,CustomerId,PhoneNumber,Email FROM Customers";
			ResultSet rs = stmt.executeQuery(query);
			List<Customer> customers = new ArrayList<Customer>();
			while (rs.next()) {
				String firstName = rs.getString("FirstName");
				String lastName = rs.getString("LastName");
				String id = rs.getString("CustomerId");
				String phone = rs.getString("PhoneNumber");
				String email = rs.getString("Email");
				Vehicle[] vehicles = getVehicles(id);
				Customer customer = new Customer(id, firstName, lastName,
						email, phone);
				customer.setVehicles(vehicles);
				customers.add(customer);
			}
			return (Customer[]) customers
					.toArray(new Customer[customers.size()]);
		} catch (Exception ex) {
			System.out.print(ex.getMessage());
			return null;
		}
	}

	public Parameter[] getParameters() {
		try {
			Statement stmt = con.createStatement();
			String query = "SELECT ParameterName,ParameterDescription FROM Parameters";
			ResultSet rs = stmt.executeQuery(query);
			List<Parameter> parameters = new ArrayList<Parameter>();
			while (rs.next()) {
				String parameterName = rs.getString("ParameterName");
				String parameterDescription = rs
						.getString("ParameterDescription");
				Parameter parameter = new Parameter(parameterName,
						parameterDescription);
				parameters.add(parameter);
			}
			return (Parameter[]) parameters.toArray(new Parameter[parameters
					.size()]);
		} catch (Exception ex) {
			System.out.print(ex.getMessage());
			return null;
		}
	}

	public VehicleFault[] getVehicleFaults() {
		try {
			Statement stmt = con.createStatement();
			String query = "SELECT VF.FaultId,VF.DateTime,VF.Dtc,VF.DTCStatus,VF.Level,VF.Details,VF.Type,V.VehicleId,V.Manufacturer,V.Model,C.CustomerId,C.FirstName,C.LastName,DTCs.DtcPriority,DTCs.DtcCssClass "
					+ "FROM VehicleFaults VF "
					+ "JOIN Devices D on VF.DeviceId=D.DeviceId "
					+ "JOIN Vehicles V on D.VehicleId = V.VehicleId "
					+ "JOIN Customers C on V.CustomerId=C.CustomerId "
					+ "JOIN DTCs on DTCs.Dtc = VF.Dtc "
					+ "ORDER BY DTCs.DtcPriority " + "LIMIT 30";
			ResultSet rs = stmt.executeQuery(query);
			List<VehicleFault> vehicleFaults = new ArrayList<>();
			while (rs.next()) {
				Device device = new Device();
				Customer customer = new Customer();
				Vehicle vehicle = new Vehicle();
				VehicleFault vehicleFault = new VehicleFault();
				DTC dtc = new DTC();
				customer.setId(rs.getString("CustomerId"));
				customer.setFirstName(rs.getString("FirstName"));
				customer.setLastName(rs.getString("LastName"));
				vehicle.setVehicleId(rs.getString("VehicleId"));
				vehicle.setCustomer(customer);
				vehicle.setManufacturer(rs.getString("Manufacturer"));
				vehicle.setModel(rs.getString("Model"));
				device.setVehicle(vehicle);
				dtc.setDtcCssClass(rs.getString("DtcCssClass"));
				dtc.setDtcPriority(Integer.parseInt(rs.getString("DtcPriority")));
				dtc.setDtc(rs.getString("Dtc"));
				vehicleFault.setDtc(dtc);
				vehicleFault.setDevice(device);
				vehicleFault.setDateTime(rs.getTime("DateTime"));
				vehicleFault.setLevel(rs.getString("Level"));
				vehicleFault.setDtcStatus(rs.getString("DTCStatus"));
				vehicleFault.setType(rs.getString("Type"));
				vehicleFault.setDetails(rs.getString("Details"));
				vehicleFaults.add(vehicleFault);
			}
			return (VehicleFault[]) vehicleFaults
					.toArray(new VehicleFault[vehicleFaults.size()]);
			// return (Parameter[])parameters.toArray(new
			// Parameter[parameters.size()]);
		} catch (Exception ex) {
			System.out.print(ex.getMessage());
			return null;
		}
	}

	public VehicleMaintenance[] getMaintenanceReport() {

		List<VehicleMaintenance> vehiclesMaintenance = new ArrayList<VehicleMaintenance>();
		try {
			Statement stmt = con.createStatement();
			String query = "call GetMaintenanceReport()";
			ResultSet rs = stmt.executeQuery(query);
			while (rs.next()) {
				Customer customer = new Customer();
				Vehicle vehicle = new Vehicle();
				VehicleMaintenance vehicleMaintenance = new VehicleMaintenance();
				customer.setId(rs.getString("CustomerId"));
				customer.setFirstName(rs.getString("FirstName"));
				customer.setLastName(rs.getString("LastName"));
				vehicle.setVehicleId(rs.getString("VehicleId"));
				vehicle.setManufacturer(rs.getString("Manufacturer"));
				vehicle.setModel(rs.getString("Model"));
				vehicle.setLastTreatment(rs.getInt("LastTreatment"));
				vehicleMaintenance.setCustomer(customer);
				vehicleMaintenance.setVehicle(vehicle);
				vehicleMaintenance.setHoursFromLastTreatment(rs
						.getInt("HoursFromLastTreatment"));
				vehicleMaintenance.setTreatmentType(rs
						.getString("TreatmentType"));
				vehicleMaintenance.setTotalHours(rs.getInt("TotalHours"));
				int hoursLeftForNextTreatment = rs
						.getInt("HoursLeftForNextTreatment");
				vehicleMaintenance
						.setHoursLeftForNextTreatment(hoursLeftForNextTreatment);
				String cssClass = hoursLeftForNextTreatment < 0 ? "danger"
						: hoursLeftForNextTreatment < 50 ? "warning"
								: "success";
				vehicleMaintenance.setCssClass(cssClass);
				vehiclesMaintenance.add(vehicleMaintenance);
			}
			return (VehicleMaintenance[]) vehiclesMaintenance
					.toArray(new VehicleMaintenance[vehiclesMaintenance.size()]);
		} catch (Exception ex) {
			System.out.print(ex.getMessage());
			return null;
		}
	}

	public Vehicle[] getVehicles(String customerId) {
		try {
			Statement stmt = con.createStatement();
			String query = "SELECT V.VehicleId, V.Manufacturer, V.Model, V.Engine, V.Year, V.HoursToTreatment, V.LastTreatment, V.CustomerId, C.FirstName, C.LastName "
					+ "FROM Vehicles V JOIN Customers C "
					+ "ON V.CustomerId=C.CustomerId "
					+ "WHERE V.CustomerId in ('" + customerId + "')";
			ResultSet rs = stmt.executeQuery(query);
			List<Vehicle> vehicles = new ArrayList<>();
			while (rs.next()) {
				Customer customer = new Customer();
				Vehicle vehicle = new Vehicle();
				customer.setId(rs.getString("CustomerId"));
				customer.setFirstName(rs.getString("FirstName"));
				customer.setLastName(rs.getString("LastName"));
				vehicle.setVehicleId(rs.getString("VehicleId"));
				vehicle.setManufacturer(rs.getString("Manufacturer"));
				vehicle.setModel(rs.getString("Model"));
				vehicle.setEngine(rs.getString("Engine"));
				vehicle.setYear(rs.getString("Year"));
				vehicle.setCustomer(customer);
				vehicles.add(vehicle);

			}
			return (Vehicle[]) vehicles.toArray(new Vehicle[vehicles.size()]);
		} catch (Exception ex) {
			System.out.print(ex.getMessage());
			return null;
		}
	}

	public Device[] getDevices() {
		List<Device> devices = new ArrayList<Device>();
		try {
			Statement stmt = con.createStatement();
			String query = "select D.DeviceId, D.VehicleId, V.Model, V.Year, D.InitialMileage, D.InitialEngineHours "
					+ "from Devices D JOIN Vehicles V on D.VehicleId = V.VehicleId";
			ResultSet rs = stmt.executeQuery(query);
			while (rs.next()) {
				Device device = new Device();
				device.setDeviceId(rs.getString("DeviceId"));
				Double initialEngineHours = rs.getDouble("InitialEngineHours");
				Double initialMileage = rs.getDouble("InitialMileage");
				device.setInitialEngineHours(initialEngineHours);
				device.setInitialMileage(initialMileage);
				device.setVehicle(getVehicleById(rs.getString("VehicleId")));
				devices.add(device);
			}
			return (Device[]) devices.toArray(new Device[devices.size()]);
		} catch (Exception ex) {
			System.out.print(ex.getMessage());
			return null;
		}
	}

	public Vehicle[] getVehicles() {
		List<Vehicle> vehicles = new ArrayList<Vehicle>();
		try {
			Statement stmt = con.createStatement();
			String query = "SELECT V.VehicleId, V.Manufacturer, V.Model, V.Engine, V.Year, V.HoursToTreatment, V.LastTreatment, V.CustomerId, C.FirstName, C.LastName "
					+ "FROM Vehicles V join Customers C on V.CustomerId = C.CustomerId";
			ResultSet rs = stmt.executeQuery(query);
			while (rs.next()) {
				Vehicle vehicle = new Vehicle();
				vehicle.setVehicleId(rs.getString("VehicleId"));
				vehicle.setManufacturer(rs.getString("Manufacturer"));
				vehicle.setModel(rs.getString("Model"));
				vehicle.setEngine(rs.getString("Engine"));
				vehicle.setYear(rs.getString("Year"));
				Customer customer = new Customer();
				customer.setId(rs.getString("CustomerId"));
				customer.setFirstName(rs.getString("FirstName"));
				customer.setLastName(rs.getString("LastName"));
				vehicle.setCustomer(customer);
				vehicles.add(vehicle);
			}
			return (Vehicle[]) vehicles.toArray(new Vehicle[vehicles.size()]);
		} catch (Exception ex) {
			System.out.print(ex.getMessage());
			return null;
		}
	}

	/************************************************************************************
	 * Create Methods
	 ************************************************************************************/

	public void createNewDevice(Device newDevice) {
		try {
			PreparedStatement statement = con
					.prepareStatement("INSERT INTO Devices(DeviceId, PurchaseDate, VehicleId, InitialEngineHours, InitialMileage) VALUES(?,?,?,?,?)");
			statement.setString(1, newDevice.getDeviceId());
			statement.setDate(2, newDevice.getPurchaseDate());
			statement.setString(3, newDevice.getVehicle().getVehicleId());
			statement.setDouble(4, newDevice.getInitialEngineHours());
			statement.setDouble(5, newDevice.getInitialMileage());
			statement.execute();
		} catch (Exception ex) {
			System.out.print(ex.getMessage());
		}
	}

	public Rule createRule(Rule rule) {
		try {
			PreparedStatement statement = con
					.prepareStatement("INSERT INTO Rules(UserEmail,RuleName,RuleDescription) VALUES(?,?,?)");
			statement.setString(1, rule.getRuleUser().getEmail());
			statement.setString(2, rule.getRuleName());
			statement.setString(3, rule.getRuleDescription());
			statement.execute();
			Statement stmt = con.createStatement();
			String query = "select MAX(RuleId) as RuleId from Rules";
			ResultSet rs = stmt.executeQuery(query);
			if (rs.next()) {
				String ruleId = rs.getString("RuleId");
				rule.setRuleId(ruleId);
			}
			return rule;
		} catch (Exception ex) {
			System.out.print(ex.getMessage());
			return null;
		}
	}

	public void createRuleCondition(Rule createdRule, RuleCondition condition) {
		try {
			PreparedStatement statement = con
					.prepareStatement("INSERT INTO RuleConditions(RuleId,ParameterName,ConditionOperator,LowValue,HighValue) VALUES(?,?,?,?,?)");
			statement.setString(1, createdRule.getRuleId());
			statement.setString(2, condition.getParameter().getParameterName());
			statement.setString(3, condition.getConditionOperator());
			statement.setInt(4, condition.getLowValue());
			statement.setInt(5, condition.getHighValue());
			statement.execute();

		} catch (Exception ex) {
			System.out.print(ex.getMessage());
		}
	}

	public void createDeviceRule(Rule rule, String[] vehicls) {
		try {
			Statement stmt = con.createStatement();
			for (int i = 0; i < vehicls.length; i++) {
				String query = "select DeviceId,VehicleId from Devices "
						+ "where VehicleId='" + vehicls[i] + "'";
				ResultSet rs = stmt.executeQuery(query);
				if (rs.next()) {
					PreparedStatement statement = con
							.prepareStatement("INSERT INTO DeviceRules(DeviceId,RuleId)  VALUES(?,?)");
					statement.setString(1, rs.getString("DeviceId"));
					statement.setString(2, rule.RuleId);
					statement.execute();
				}
			}
		} catch (Exception ex) {
			System.out.print(ex.getMessage());
		}
	}

	public RuleAlert[] getRuleAlerts() {
		List<RuleAlert> ruleAlerts = new ArrayList<RuleAlert>();
		try {
			Statement stmt = con.createStatement();
			String query = "SELECT * FROM RuleAlerts LIMIT 50";
			ResultSet rs = stmt.executeQuery(query);
			while (rs.next()) {
				RuleAlert ruleAlert = new RuleAlert();
				ruleAlert.setPidData(getPIDDataById(rs.getString("MessageId")));
				ruleAlert.setRuleCondition(getRuleConditionById(
						rs.getString("RuleId"), rs.getString("ParameterName")));
				ruleAlerts.add(ruleAlert);
			}
			return (RuleAlert[]) ruleAlerts.toArray(new RuleAlert[ruleAlerts
					.size()]);
		} catch (Exception ex) {
			System.out.print(ex.getMessage());
			return null;
		}

	}

	/************************************************************************************
	 * get Dim Classes
	 ************************************************************************************/

	public Device getDeviceById(String deviceId) throws SQLException {
		PreparedStatement preparedStatement = getElementById("Devices",
				"DeviceId", deviceId);
		ResultSet rs = preparedStatement.executeQuery();
		Device device = new Device();
		if (rs.next()) {
			device.setDeviceId(rs.getString("DeviceId"));
			device.setInitialEngineHours(rs.getLong("InitialEngineHours"));
			device.setInitialMileage(rs.getDouble("InitialMileage"));
			// device.setPurchaseDate(rs.getDate("PurchaseDate"));
			device.setVehicle(getVehicleById(rs.getString("VehicleId")));
		}
		return device;
	}

	public Vehicle getVehicleById(String vehicleId) {
		try {
			PreparedStatement preparedStatement = getElementById("Vehicles",
					"VehicleId", vehicleId);
			ResultSet rs = preparedStatement.executeQuery();
			Vehicle vehicle = new Vehicle();
			if (rs.next()) {
				vehicle.setVehicleId(rs.getString("VehicleId"));
				vehicle.setManufacturer(rs.getString("Manufacturer"));
				vehicle.setModel(rs.getString("Model"));
				vehicle.setEngine(rs.getString("Engine"));
				vehicle.setYear(rs.getString("Year"));
				vehicle.setCustomer(getCustomerById(rs.getString("CustomerId")));
			}
			return vehicle;
		} catch (Exception ex) {
			System.out.print(ex.getMessage());
			return null;
		}
	}

	public Customer getCustomerById(String customerId) {
		try {
			PreparedStatement preparedStatement = getElementById("Customers",
					"CustomerId", customerId);
			ResultSet rs = preparedStatement.executeQuery();
			Customer customer = new Customer();
			if (rs.next()) {
				customer.setId(rs.getString("CustomerId"));
				customer.setFirstName(rs.getString("FirstName"));
				customer.setLastName(rs.getString("LastName"));
			}
			return customer;
		} catch (Exception ex) {
			System.out.print(ex.getMessage());
			return null;
		}
	}

	public PIDData getPIDDataById(String pidDataId) {
		try {
			PreparedStatement preparedStatement = getElementById("PIDData",
					"MessageId", pidDataId);
			ResultSet rs = preparedStatement.executeQuery();
			PIDData pidData = new PIDData();
			if (rs.next()) {
				pidData.setDevice(getDeviceById(rs.getString("DeviceId")));
				pidData.setMessageId(rs.getString("MessageId"));
				pidData.setTime(rs.getTime("Time"));
				pidData.setValue(rs.getDouble("Value"));
				pidData.setParameter(getParameterById(rs
						.getString("ParameterName")));
			}
			return pidData;
		} catch (Exception ex) {
			System.out.print(ex.getMessage());
			return null;
		}
	}

	public Parameter getParameterById(String parameterName) {
		try {
			PreparedStatement preparedStatement = getElementById("Parameters",
					"ParameterName", parameterName);
			ResultSet rs = preparedStatement.executeQuery();
			Parameter parameter = new Parameter();
			if (rs.next()) {
				parameter.setParameterDescription(rs
						.getString("ParameterDescription"));
				parameter.setParameterName(rs.getString("ParameterName"));
			}
			return parameter;
		} catch (Exception ex) {
			System.out.print(ex.getMessage());
			return null;
		}
	}

	public RuleCondition getRuleConditionById(String ruleId,
			String parameterName) {
		PreparedStatement preparedStatement = null;
		RuleCondition ruleCondition = new RuleCondition();
		String query = "SELECT * FROM RuleConditions "
				+ "WHERE RuleId = ? and ParameterName=?";
		try {
			preparedStatement = con.prepareStatement(query);
			preparedStatement.setString(1, ruleId);
			preparedStatement.setString(2, parameterName);
			ResultSet rs = preparedStatement.executeQuery();
			if (rs.next()) {
				ruleCondition.setConditionOperator(rs
						.getString("ConditionOperator"));
				ruleCondition.setParameter(getParameterById(rs
						.getString("ParameterName")));
				ruleCondition.setRule(getRuleById(rs.getString("RuleId")));
				ruleCondition.setLowValue(rs.getInt("LowValue"));
				ruleCondition.setHighValue(rs.getInt("HighValue"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.print(e.getMessage());
			return null;
		}
		return ruleCondition;
	}

	private Rule getRuleById(String ruleId) {
		try {
			PreparedStatement preparedStatement = getElementById("Rules",
					"RuleId", ruleId);
			ResultSet rs = preparedStatement.executeQuery();
			Rule rule = new Rule();
			if (rs.next()) {
				rule.setRuleId(rs.getString("RuleId"));
				rule.setRuleName(rs.getString("RuleName"));
				rule.setRuleDescription(rs.getString("RuleDescription"));
				rule.setRuleUser(getUser(rs.getString("UserEmail")));
			}
			return rule;
		} catch (Exception ex) {
			System.out.print(ex.getMessage());
			return null;
		}
	}

	public User getUser(String email) {
		try {
			Statement stmt = con.createStatement();
			String query = "SELECT * FROM Users where UserEmail='" + email
					+ "'";
			ResultSet rs = stmt.executeQuery(query);
			User user = null;
			if (rs.next()) {
				String firstName = rs.getString("FirstName");
				String lastName = rs.getString("LastName");
				String password = rs.getString("Password");
				user = new User(email, firstName, lastName, password);
			}
			return user;
		} catch (Exception ex) {
			System.out.print(ex.getMessage());
			return null;
		}
	}

	/************************************************************************************/
	/* All Query generators here -TODO - move to another place in the future */
	/************************************************************************************/

	public PreparedStatement getElementById(String tableName,
			String IdColumnName, String value) {
		PreparedStatement preparedStatement = null;
		String query = "SELECT * FROM " + tableName + " " + "WHERE "
				+ IdColumnName + "=?";
		try {
			preparedStatement = con.prepareStatement(query);
			preparedStatement.setString(1, value);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.print(e.getMessage());
			return null;
		}
		return preparedStatement;
	}

	public PreparedStatement getEditRowStatement(String tableName,
			String attributeName, String pk, String value, String IdColumnName) {
		PreparedStatement preparedStatement = null;
		String query = "UPDATE " + tableName + " " + "SET " + attributeName
				+ "=?" + " " + "WHERE " + IdColumnName + "=?";
		try {
			preparedStatement = con.prepareStatement(query);
			preparedStatement.setString(1, value);
			preparedStatement.setString(2, pk);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.print(e.getMessage());
			return null;
		}
		return preparedStatement;
	}

	public GraphObj[] getGraphData(Date endDate, String[] vehicles,
			String parameterName, String aggregationType, String timeResolution)
			throws SQLException {
		// TODO Auto-generated method stubpn
		Statement stmt = con.createStatement();
		String query = null;
		int i;
		String vehiclesIn = "(";
		for (i = 0; i < vehicles.length - 1; i++) {
			vehiclesIn += "'" + vehicles[i] + "',";
		}
		vehiclesIn += "'" + vehicles[i] + "')";

		switch (timeResolution) {
		case "Day":
			query = "SELECT VehicleId ,Date(Time) as Time,"
					+ aggregationType
					+ "(value) as value "
					+ "FROM PIDData P join Devices D "
					+ "on P.DeviceId=D.DeviceId "
					+ "where ParameterName='"
					+ parameterName
					+ "' "
					+ "and VehicleId in "
					+ vehiclesIn
					+ " "
					+ "and Time Between DATE_SUB('2015-03-11' ,INTERVAL 30 DAY) "
					// +
					// "and Time Between DATE_SUB('"+endDate+"' ,INTERVAL 30 DAY) and '"+endDate+"' "
					+ "group by VehicleId,Hour(Time)"
					+ "order by VehicleId, Hour(Time)";

			break;

		case "Hour":
			query = "SELECT VehicleId,Hour(Time) as Time," + aggregationType
					+ "(value) as value " + "FROM PIDData P join Devices D "
					+ "on P.DeviceId=D.DeviceId " + "where ParameterName='"
					+ parameterName + "' " + "and VehicleId in " + vehiclesIn
					+ " " + "and Date(Time)='2015-03-11' "
					// + "and Date(Time)='"+endDate+"' "
					+ "group by VehicleId,Hour(Time)"
					+ "order by VehicleId, Hour(Time)";

			break;
		}

		List<GraphObj> graphObjs = new ArrayList<>();
		ResultSet rs = stmt.executeQuery(query);
		GraphObj graphObj1 = new GraphObj();
		graphObj1.setVehicle(getVehicleById("41790"));
		graphObj1.setParam(parameterName);
		Map<String, String> val1 = new HashMap<String, String>();

		val1.put("19","16.22222222222222");
		graphObj1.setValues(val1);
		val1.put("20","20.5");
		graphObj1.setValues(val1);
		val1.put("21","9.722222222222221");
		graphObj1.setValues(val1);
		val1.put("22","7.428571428571429");
		graphObj1.setValues(val1);
		graphObjs.add(graphObj1);
		
		GraphObj graphObj2 = new GraphObj();
		graphObj2.setVehicle(getVehicleById("41820"));
		graphObj2.setParam(parameterName);
		Map<String, String> val2 = new HashMap<String, String>();	
		val2.put("20","8.375");
		graphObj2.setValues(val2);
		val2.put("10","5");
		graphObj2.setValues(val2);
		graphObjs.add(graphObj2);
		

		return (GraphObj[]) graphObjs.toArray(new GraphObj[graphObjs.size()]);
			
		}
	
}