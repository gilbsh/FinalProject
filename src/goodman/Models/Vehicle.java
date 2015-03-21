package goodman.Models;

public class Vehicle {
	String vehicleId;
	String manufacturer;
	String model;
	String engine;
	String year;
	String customerId;
	
	
	public Vehicle(String vehicleId, String manufacturer, String model,
			String engine, String year, String customerId) {
		super();
		this.vehicleId = vehicleId;
		this.manufacturer = manufacturer;
		this.model = model;
		this.engine = engine;
		this.year = year;
		this.customerId = customerId;
	}
	
	public String getVehicleId() {
		return vehicleId;
	}
	public void setvehicleId(String vehicleId) {
		this.vehicleId = vehicleId;
	}
	public String getManufacturer() {
		return manufacturer;
	}
	public void setManufacturer(String manufacturer) {
		this.manufacturer = manufacturer;
	}
	public String getModel() {
		return model;
	}
	public void setModel(String model) {
		this.model = model;
	}
	public String getEngine() {
		return engine;
	}
	public void setEngine(String engine) {
		this.engine = engine;
	}
	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		this.year = year;
	}
	public String getCustomerId() {
		return customerId;
	}
	public void setCustomerId(String customerId) {
		this.customerId = customerId;
	}
	
	
}


