package goodman.Models;

import java.sql.Time;
import java.util.Date;


public class VehicleFault {
	
	DTC dtc;
	String level;
	String dateTime;
	String type;
	String dtcStatus;
	String details;
	Location location;
	

	public Location getLocation() {
		return location;
	}

	public void setLocation(Location location) {
		this.location = location;
	}

	public String getDetails() {
		return details;
	}

	public void setDetails(String details) {
		this.details = details;
	}


	Device device;

	public VehicleFault() {
		// TODO Auto-generated constructor stub
	}




	public DTC getDtc() {
		return dtc;
	}




	public void setDtc(DTC dtc) {
		this.dtc = dtc;
	}




	public Device getDevice() {
		return device;
	}


	public void setDevice(Device device) {
		this.device = device;
	}


	public String getLevel() {
		return level;
	}


	public void setLevel(String level) {
		this.level = level;
	}


	public String getDateTime() {
		return dateTime;
	}

	public void setDateTime(Date date,Time time) {
			this.dateTime = String.valueOf(date)+" "+String.valueOf(time);
	}

	public String getType() {
		return type;
	}


	public void setType(String type) {
		this.type = type;
	}


	public String getDtcStatus() {
		return dtcStatus;
	}


	public void setDtcStatus(String dtcStatus) {
		this.dtcStatus = dtcStatus;
	}
	
	
}

