package goodman.Models;

public class Parameter {
	
	String parameterId;
	String parameterName;
	String parameterDescription;
	
	
	public Parameter(String parameterId, String parameterName,String parameterDescription) {
		super();
		this.parameterId = parameterId;
		this.parameterName = parameterName;
		this.parameterDescription = parameterDescription;
	}
	public String getParameterId() {
		return parameterId;
	}
	public void setParameterId(String parameterId) {
		this.parameterId = parameterId;
	}
	public String getParameterName() {
		return parameterName;
	}
	public void setParameterName(String parameterName) {
		this.parameterName = parameterName;
	}
	public String getParameterDescription() {
		return parameterDescription;
	}
	public void setParameterDescription(String parameterDescription) {
		this.parameterDescription = parameterDescription;
	}
	
	
}
