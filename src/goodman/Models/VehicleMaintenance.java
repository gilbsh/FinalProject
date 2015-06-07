package goodman.Models;

public class VehicleMaintenance {
	
	Customer customer;
	Vehicle vehicle;
	int totalHours;
	String treatmentType;
	int hoursFromLastTreatment;
	int hoursLeftForNextTreatment;
	String cssClass;
	
	public String getCssClass() {
		return cssClass;
	}
	public void setCssClass(String cssClass) {
		this.cssClass = cssClass;
	}
	
	public Customer getCustomer() {
		return customer;
	}
	public void setCustomer(Customer customer) {
		this.customer = customer;
	}
	public Vehicle getVehicle() {
		return vehicle;
	}
	public void setVehicle(Vehicle vehicle) {
		this.vehicle = vehicle;
	}
	public int getTotalHours() {
		return totalHours;
	}
	public void setTotalHours(int totalHours) {
		this.totalHours = totalHours;
	}
	public String getTreatmentType() {
		return treatmentType;
	}
	public void setTreatmentType(String treatmentType) {
		this.treatmentType = treatmentType;
	}
	public int getHoursFromLastTreatment() {
		return hoursFromLastTreatment;
	}
	public void setHoursFromLastTreatment(int hoursFromLastTreatment) {
		this.hoursFromLastTreatment = hoursFromLastTreatment;
	}
	public int getHoursLeftForNextTreatment() {
		return hoursLeftForNextTreatment;
	}
	public void setHoursLeftForNextTreatment(int hoursLeftForNextTreatment) {
		this.hoursLeftForNextTreatment = hoursLeftForNextTreatment;
	}
}
