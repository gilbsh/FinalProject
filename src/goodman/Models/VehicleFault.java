package goodman.Models;

import java.util.Date;


public class VehicleFault {
	
	String dtc;
	String deviceId;
	String level;
	Date dateTime;
	String type;
	String dtcStatus;
	
	public VehicleFault(String dtc, String deviceId, String level,
			Date dateTime, String type, String dtcStatus) {
		super();
		this.dtc = dtc;
		this.deviceId = deviceId;
		this.level = level;
		this.dateTime = dateTime;
		this.type = type;
		this.dtcStatus = dtcStatus;
	}

	
	private VehicleFault() {
		super();
		// TODO Auto-generated constructor stub
	}


	public String getDtc() {
		return dtc;
	}


	public void setDtc(String dtc) {
		this.dtc = dtc;
	}


	public String getDeviceId() {
		return deviceId;
	}


	public void setDeviceId(String deviceId) {
		this.deviceId = deviceId;
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

