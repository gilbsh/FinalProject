package goodman.Models;

import java.sql.Date;
import java.sql.Time;


public class PIDData {
	String messageId;
	Device device;
	Parameter parameter;
	String time;
	double value;
	public String getMessageId() {
		return messageId;
	}
	public void setMessageId(String messageId) {
		this.messageId = messageId;
	}
	public Device getDevice() {
		return device;
	}
	public void setDevice(Device device) {
		this.device = device;
	}
	public Parameter getParameter() {
		return parameter;
	}
	public void setParameter(Parameter parameter) {
		this.parameter = parameter;
	}
	public String getTime() {
		return time;
	}
	public void setTime(Date date,Time time) {
		this.time = String.valueOf(date)+" "+String.valueOf(time);
	}

	public double getValue() {
		return value;
	}
	public void setValue(double value) {
		this.value = value;
	}
	
	
}
