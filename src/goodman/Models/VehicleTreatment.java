package goodman.Models;

import java.util.Arrays;
import java.util.Date;

public class VehicleTreatment {
	
	Date date;
	Vehicle vehicle;
	String descriptions;
	String treatmentType;
	int vehicleTotalEngineHours;
	TreatmentAction[] treatmentAction;
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public Vehicle getVehicle() {
		return vehicle;
	}
	public void setVehicle(Vehicle vehicle) {
		this.vehicle = vehicle;
	}
	public String getDescriptions() {
		return descriptions;
	}
	public void setDescriptions(String descriptions) {
		this.descriptions = descriptions;
	}
	public String getTreatmentType() {
		return treatmentType;
	}
	public void setTreatmentType(String treatmentType) {
		this.treatmentType = treatmentType;
	}
	public int getVehicleTotalEngineHours() {
		return vehicleTotalEngineHours;
	}
	public void setVehicleTotalEngineHours(int vehicleTotalEngineHours) {
		this.vehicleTotalEngineHours = vehicleTotalEngineHours;
	}
	public TreatmentAction[] getTreatmentAction() {
		return treatmentAction;
	}
	public void setTreatmentAction(TreatmentAction[] treatmentAction) {
		this.treatmentAction = treatmentAction;
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((date == null) ? 0 : date.hashCode());
		result = prime * result
				+ ((descriptions == null) ? 0 : descriptions.hashCode());
		result = prime * result + Arrays.hashCode(treatmentAction);
		result = prime * result
				+ ((treatmentType == null) ? 0 : treatmentType.hashCode());
		result = prime * result + ((vehicle == null) ? 0 : vehicle.hashCode());
		result = prime * result + vehicleTotalEngineHours;
		return result;
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		VehicleTreatment other = (VehicleTreatment) obj;
		if (date == null) {
			if (other.date != null)
				return false;
		} else if (!date.equals(other.date))
			return false;
		if (descriptions == null) {
			if (other.descriptions != null)
				return false;
		} else if (!descriptions.equals(other.descriptions))
			return false;
		if (!Arrays.equals(treatmentAction, other.treatmentAction))
			return false;
		if (treatmentType == null) {
			if (other.treatmentType != null)
				return false;
		} else if (!treatmentType.equals(other.treatmentType))
			return false;
		if (vehicle == null) {
			if (other.vehicle != null)
				return false;
		} else if (!vehicle.equals(other.vehicle))
			return false;
		if (vehicleTotalEngineHours != other.vehicleTotalEngineHours)
			return false;
		return true;
	}
	
	
}
