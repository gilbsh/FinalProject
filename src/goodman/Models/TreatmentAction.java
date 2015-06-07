package goodman.Models;

public class TreatmentAction {
	VehicleTreatment vehicleTreatment;
	String action;
	String description;
	public VehicleTreatment getVehicleTreatment() {
		return vehicleTreatment;
	}
	public void setVehicleTreatment(VehicleTreatment vehicleTreatment) {
		this.vehicleTreatment = vehicleTreatment;
	}
	public String getAction() {
		return action;
	}
	public void setAction(String action) {
		this.action = action;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((action == null) ? 0 : action.hashCode());
		result = prime * result
				+ ((description == null) ? 0 : description.hashCode());
		result = prime
				* result
				+ ((vehicleTreatment == null) ? 0 : vehicleTreatment.hashCode());
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
		TreatmentAction other = (TreatmentAction) obj;
		if (action == null) {
			if (other.action != null)
				return false;
		} else if (!action.equals(other.action))
			return false;
		if (description == null) {
			if (other.description != null)
				return false;
		} else if (!description.equals(other.description))
			return false;
		if (vehicleTreatment == null) {
			if (other.vehicleTreatment != null)
				return false;
		} else if (!vehicleTreatment.equals(other.vehicleTreatment))
			return false;
		return true;
	}
	
	
}
