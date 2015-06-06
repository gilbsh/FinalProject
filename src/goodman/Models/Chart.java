package goodman.Models;

public class Chart {
	
	String x;
	
	ChartData data;
	
	Axis axis;

	public ChartData getData() {
		return data;
	}

	public void setData(ChartData data) {
		this.data = data;
	}

	public String getX() {
		return x;
	}

	public void setX(String x) {
		this.x = x;
	}

	public Axis getAxis() {
		return axis;
	}

	public void setAxis(Axis axis) {
		this.axis = axis;
	}
	
	

}
