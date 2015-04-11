package goodman.Models;

public class Vehicle {
	String vehicleId;
	String manufacturer;
	String model;
	String engine;
	String year;
	int hoursToTreatment;
	Customer customer;
	double lastTreatment;
	
	public double getLastTreatment() {
		return lastTreatment;
	}

	public void setLastTreatment(double lastTreatment) {
		this.lastTreatment = lastTreatment;
	}

	public Vehicle(){}

	public int getHoursToTreatment() {
		return hoursToTreatment;
	}
	public void setHoursToTreatment(int hoursToTreatment) {
		this.hoursToTreatment = hoursToTreatment;
	}
	public String getVehicleId() {
		return vehicleId;
	}
	public void setVehicleId(String vehicleId) {
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
	public Customer getCustomer() {
		return this.customer;
	}
	public void setCustomer(Customer customer) {
		this.customer = customer;
	}
	
	
}


