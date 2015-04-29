package goodman.Models;

import java.util.Date;

public class Device {
	
	public String getDeviceId() {
		return deviceId;
	}
	public void setDeviceId(String deviceId) {
		this.deviceId = deviceId;
	}
	public String getPurchaseDate() {
		return purchaseDate;
	}
	public void setPurchaseDate(String purchaseDate) {
		this.purchaseDate = purchaseDate;
	}
	public Vehicle getVehicle() {
		return vehicle;
	}
	public void setVehicle(Vehicle vehicle) {
		this.vehicle = vehicle;
	}
	public String getInitialEngineHours() {
		return initialEngineHours;
	}
	public void setInitialEngineHours(String initialEngineHours) {
		this.initialEngineHours = initialEngineHours;
	}
	public String getInitialMileage() {
		return initialMileage;
	}
	public void setInitialMileage(String initialMileage) {
		this.initialMileage = initialMileage;
	}
	
	String deviceId;
	String purchaseDate;
	Vehicle vehicle;
	
	String initialEngineHours;
	String initialMileage;	
}
