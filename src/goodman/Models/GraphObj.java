package goodman.Models;
import java.sql.Date;
import java.util.Map;

public class GraphObj {

public GraphObj() {
		super();
		}
Vehicle vehicle;
String param;
Map <String,String> values;
public Vehicle getVehicle() {
	return vehicle;
}
public void setVehicle(Vehicle vehicle) {
	this.vehicle = vehicle;
}
public String getParam() {
	return param;
}
public void setParam(String param) {
	this.param = param;
}
public Map<String, String> getValues() {
	return values;
}
public void setValues(Map<String, String> values) {
	this.values = values;
}


}


