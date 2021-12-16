package exception;

public class UpdateException extends RuntimeException {
	private String url;
	public UpdateException (String msg,String url) {  //생성자
		super(msg);
		this.url = url;
	}
	public String getUrl() {
		return url;
	}
}