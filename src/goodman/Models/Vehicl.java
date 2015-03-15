package goodman.Models;

public class Vehicl {
	String VehicleId;
	String Manufacturer;
	String Model;
	String Engine;
	String Year;
	String CustomerId;
	
	
	public Vehicl(String vehicleId, String manufacturer, String model,
			String engine, String year, String customerId) {
		super();
		VehicleId = vehicleId;
		Manufacturer = manufacturer;
		Model = model;
		Engine = engine;
		Year = year;
		CustomerId = customerId;
	}
	
	public String getVehicleId() {
		return VehicleId;
	}
	public void setVehicleId(String vehicleId) {
		VehicleId = vehicleId;
	}
	public String getManufacturer() {
		return Manufacturer;
	}
	public void setManufacturer(String manufacturer) {
		Manufacturer = manufacturer;
	}
	public String getModel() {
		return Model;
	}
	public void setModel(String model) {
		Model = model;
	}
	public String getEngine() {
		return Engine;
	}
	public void setEngine(String engine) {
		Engine = engine;
	}
	public String getYear() {
		return Year;
	}
	public void setYear(String year) {
		Year = year;
	}
	public String getCustomerId() {
		return CustomerId;
	}
	public void setCustomerId(String customerId) {
		CustomerId = customerId;
	}
	
	
}


