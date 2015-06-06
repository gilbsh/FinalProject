package goodman.Models;

import java.util.Map;

public class ChartData {
	
	Map<String,String> xs;
	
	String x;
	
	public String getX() {
		return x;
	}

	public void setX(String x) {
		this.x = x;
	}

	String[][] columns;

	public Map<String, String> getXs() {
		return xs;
	}

	public void setXs(Map<String, String> xs) {
		this.xs = xs;
	}

	public String[][] getColumns() {
		return columns;
	}

	public void setColumns(String[][] columns) {
		this.columns = columns;
	}
	
	

}
