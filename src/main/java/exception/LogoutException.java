package exception;

public class LogoutException extends RuntimeException {
	private static final long serialVersionUID = 7135915179873394050L;
	private String url;
	public LogoutException (String msg) {
		super(msg);
	}
	public LogoutException (String msg, String url) {
		super(msg);
		this.url = url;
	}
	public String getUrl() {
		return url;
	}
}
