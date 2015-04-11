package goodman.Models;

import java.util.*;
import java.sql.Connection;
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
	Connection con;
	
	public DataLayer(String url,String userName, String password,String dataBaseName){
		this.url=url.toString();
		this.userName=userName.toString();
		this.password = password.toString();
		this.dataBaseName = dataBaseName.toString();
		this.connectionString = new String(url+"/"+dataBaseName);
		
	}
	public DataLayer(){
		this.url= "jdbc:mysql://finalprojectdb.ctsvfo0gnwiz.us-west-2.rds.amazonaws.com:3306";
		this.userName="shahar";
		this.dataBaseName="finalprojectdb";
		this.password="finalprojectdb";
		this.connectionString = new String(url+"/"+dataBaseName);
	}
	
	public boolean connect(){
		try
        {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection(connectionString,userName,password);	
			return true;
        }
        catch(Exception ex){
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
	
	public User getUser(String email){
		try{
			Statement stmt = con.createStatement();
			String query = "SELECT * FROM Users where UserEmail='"+email+"'";
			ResultSet rs = stmt.executeQuery(query);
			User user = null;
			if(rs.next()){
				String firstName = rs.getString("FirstName");
				String lastName = rs.getString("LastName");
				String password = rs.getString("Password");
				user = new User(email,firstName,lastName,password);
				}
			return user;
		}
		catch(Exception ex){
			System.out.print(ex.getMessage());
			return null;
		}
	}
	
	public Customer[] getCustomers(){
		try{
			Statement stmt = con.createStatement();
			String query = "SELECT FirstName,LastName,CustomerId,PhoneNumber,Email FROM Customers";
			ResultSet rs = stmt.executeQuery(query);
			List<Customer> customers = new ArrayList<Customer>();
			while(rs.next()){
				String firstName = rs.getString("FirstName");
				String lastName = rs.getString("LastName");
				String id = rs.getString("CustomerId");
				String phone = rs.getString("PhoneNumber");
				String email = rs.getString("Email");
				Vehicle[] vehicles=getVehicles(id);
				Customer customer = new Customer(id,firstName,lastName,email,phone);
				customer.setVehicles(vehicles);
				customers.add(customer);				
				}			
			return (Customer[])customers.toArray(new Customer[customers.size()]);
		}
		catch(Exception ex){
			System.out.print(ex.getMessage());
			return null;
		}
	}
	
	public Parameter[] getParameters(){
		try{
			Statement stmt = con.createStatement();
			String query = "SELECT ParameterName,ParameterDescription FROM Parameters";
			ResultSet rs = stmt.executeQuery(query);
			List<Parameter> parameters = new ArrayList<Parameter>();
			while(rs.next()){
				String parameterName = rs.getString("ParameterName");
				String parameterDescription = rs.getString("ParameterDescription");
				Parameter parameter = new Parameter(parameterName,parameterDescription);
				parameters.add(parameter);				
				}			
			return (Parameter[])parameters.toArray(new Parameter[parameters.size()]);
		}
		catch(Exception ex){
			System.out.print(ex.getMessage());
			return null;
		}
	}
	
	public VehicleFault[] getVehicleFaults(){
		try{
			Statement stmt = con.createStatement();
			String query = "SELECT VF.FaultId,VF.DateTime,VF.Dtc,VF.DTCStatus,VF.Level,VF.Details,VF.Type,V.VehicleId,V.Manufacturer,V.Model,C.CustomerId,C.FirstName,C.LastName,DTCs.DtcPriority,DTCs.DtcCssClass "
					+ "FROM VehicleFaults VF "
					+ "JOIN Devices D on VF.DeviceId=D.DeviceId "
					+ "JOIN Vehicles V on D.VehicleId = V.VehicleId "
					+ "JOIN Customers C on V.CustomerId=C.CustomerId "
					+ "JOIN DTCs on DTCs.Dtc = VF.Dtc "
					+ "ORDER BY DTCs.DtcPriority";
			ResultSet rs = stmt.executeQuery(query);
			List<VehicleFault> vehicleFaults = new ArrayList<>();
			while(rs.next()){
				Device device= new Device();
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
			return (VehicleFault[])vehicleFaults.toArray(new VehicleFault[vehicleFaults.size()]);
			//return (Parameter[])parameters.toArray(new Parameter[parameters.size()]);
		}
		catch(Exception ex){
			System.out.print(ex.getMessage());
			return null;
		}
	}
	
	public Vehicle[] getVehicles( String customerId){
		try{
			Statement stmt = con.createStatement();
			String query = "SELECT V.VehicleId, V.Manufacturer, V.Model, V.Engine, V.Year, V.HoursToTreatment, V.LastTreatment, V.CustomerId, C.FirstName, C.LastName "
					+ "FROM Vehicles V JOIN Customers C "
					+ "ON V.CustomerId=C.CustomerId "
					+ "WHERE V.CustomerId in ('" + customerId +"')";
			ResultSet rs = stmt.executeQuery(query);
			List<Vehicle> vehicles = new ArrayList<>();
			while(rs.next()){
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
			return (Vehicle[])vehicles.toArray(new Vehicle[vehicles.size()]);
		}
		catch(Exception ex){
			System.out.print(ex.getMessage());
			return null;
		}
	}
	
	public Rule createRule(Rule rule){		
		try{
			PreparedStatement statement = con.prepareStatement("INSERT INTO Rules(UserEmail,RuleName,RuleDescription) VALUES(?,?,?)");
			statement.setString(1,  rule.getRuleUser().getEmail());
			statement.setString(2,  rule.getRuleName());
			statement.setString(3,  rule.getRuleDescription());
			statement.execute();
			Statement stmt = con.createStatement();
			String query = "select MAX(RuleId) as RuleId from Rules";
			ResultSet rs = stmt.executeQuery(query);
			if(rs.next())
				{
				String ruleId= rs.getString("RuleId");
				rule.setRuleId(ruleId);
				}
			return rule;
		}
		catch(Exception ex){
			System.out.print(ex.getMessage());
			return null;
		}
	}
	
	public void createRuleCondition(Rule createdRule, RuleCondition condition ) {
		try{
			PreparedStatement statement = con.prepareStatement("INSERT INTO RuleConditions(RuleId,ParameterName,ConditionOperator,LowValue,HighValue) VALUES(?,?,?,?,?)");
			statement.setString(1,  createdRule.getRuleId());
			statement.setString(3,  condition.getParameterName());
			statement.setString(2,  condition.getConditionOperator());
			statement.setString(4,  condition.getLowValue());
			statement.setString(5,  condition.getHighValue());
			statement.execute();
			
		}
		catch(Exception ex){
			System.out.print(ex.getMessage());
				}
		
	}
	

	public void createDeviceRule(Rule rule, String[] vehicls) {
		try{
			Statement stmt = con.createStatement();
			for (int i=0;i<vehicls.length;i++){
				String query = "select DeviceId,VehicleId from Devices "
				+ "where VehicleId='"+ vehicls[i] +"'";
				ResultSet rs = stmt.executeQuery(query);
				if(rs.next())
					{
					PreparedStatement statement = con.prepareStatement("INSERT INTO DeviceRules(DeviceId,RuleId)  VALUES(?,?)");
					statement.setString(1,  rs.getString("DeviceId"));
					statement.setString(2,  rule.RuleId);
					statement.execute();
					}
			}
		}
		catch(Exception ex){
			System.out.print(ex.getMessage());
				}
	}
	
	public VehicleMaintenance[] getMaintenanceReport(){
		
		List<VehicleMaintenance> vehiclesMaintenance = new ArrayList<VehicleMaintenance>();
		try{
			Statement stmt = con.createStatement();
			String query ="call GetMaintenanceReport()";
			ResultSet rs = stmt.executeQuery(query);
			while(rs.next()){
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
				vehicleMaintenance.setHoursFromLastTreatment(rs.getInt("HoursFromLastTreatment"));
				vehicleMaintenance.setTreatmentType(rs.getString("TreatmentType"));
				vehicleMaintenance.setTotalHours(rs.getInt("TotalHours"));
				int hoursLeftForNextTreatment= rs.getInt("HoursLeftForNextTreatment");
				vehicleMaintenance.setHoursLeftForNextTreatment(rs.getInt("HoursLeftForNextTreatment"));
				String cssClass= hoursLeftForNextTreatment < 0 ? "danger" : hoursLeftForNextTreatment <50 ? "warning" : "active";				
				vehicleMaintenance.setCssClass(cssClass);
				vehiclesMaintenance.add(vehicleMaintenance);
			}
			return (VehicleMaintenance[])vehiclesMaintenance.toArray(new VehicleMaintenance[vehiclesMaintenance.size()]);
		}
		catch(Exception ex){
			System.out.print(ex.getMessage());
			return null;
		}
	}
	
	public void close(){
		try{
		this.con.close();
		}
		catch(Exception ex){
			System.out.print("Coudln't close connections");
		}
	}
	
	
}
