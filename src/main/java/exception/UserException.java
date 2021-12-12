package exception;

public class UserException extends RuntimeException {
	/**
	 * 
	 */
	private static final long serialVersionUID = -276428601581790742L;
	private String url;
	public UserException (String msg, String url) {
		super(msg);
		this.url = url;
	}
	public String getUrl() {
		return url;
	}
}