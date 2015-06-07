package goodman.Models;

public class Parameter {
	
	String parameterName;
	String parameterDescription;
	
	
	public Parameter( String parameterName,String parameterDescription) {
		super();
		this.parameterName = parameterName;
		this.parameterDescription = parameterDescription;
	}
	
	public Parameter(){
		
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
