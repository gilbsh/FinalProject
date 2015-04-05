package goodman.Models;

import java.util.Date;


public class VehicleFault {
	
	DTC dtc;
	String level;
	Date dateTime;
	String type;
	String dtcStatus;
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


	public Date getDateTime() {
		return dateTime;
	}


	public void setDateTime(Date dateTime) {
		this.dateTime = dateTime;
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

