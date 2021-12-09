package exception;

public class SigninException extends RuntimeException {
	/**
	 * 
	 */
	private static final long serialVersionUID = 7135915179873394050L;
	private String url;
	public SigninException (String msg, String url) {
		super(msg);
		this.url = url;
	}
	public String getUrl() {
		return url;
	}
}
