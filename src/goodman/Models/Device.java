package goodman.Models;

import java.util.Date;

public class Device {
	
	public String getDeviceId() {
		return deviceId;
	}
	public void setDeviceId(String deviceId) {
		this.deviceId = deviceId;
	}
	public Date getPurchaseDate() {
		return purchaseDate;
	}
	public void setPurchaseDate(Date purchaseDate) {
		this.purchaseDate = purchaseDate;
	}
	public Vehicle getVehicle() {
		return vehicle;
	}
	public void setVehicle(Vehicle vehicle) {
		this.vehicle = vehicle;
	}
	public Double getInitialEngineHours() {
		return initialEngineHours;
	}
	public void setInitialEngineHours(double initialEngineHours) {
		this.initialEngineHours = initialEngineHours;
	}
	public Double getInitialMileage() {
		return initialMileage;
	}
	public void setInitialMileage(double initialMileage) {
		this.initialMileage = initialMileage;
	}
	
	String deviceId;
	Date purchaseDate;
	Vehicle vehicle;
	
	Double initialEngineHours;
	Double initialMileage;	
}
