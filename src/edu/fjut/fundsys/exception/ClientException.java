/**
 * 
 */
package edu.fjut.fundsys.exception;

/**
 * @author ÃÔ”Ó
 *
 */
public class ClientException extends RuntimeException {

	/**
	 * 
	 */
	public ClientException() {
		// TODO Auto-generated constructor stub
	}

	/**
	 * @param message
	 */
	public ClientException(String message) {
		super(message);
		// TODO Auto-generated constructor stub
	}

	/**
	 * @param cause
	 */
	public ClientException(Throwable cause) {
		super(cause);
		// TODO Auto-generated constructor stub
	}

	/**
	 * @param message
	 * @param cause
	 */
	public ClientException(String message, Throwable cause) {
		super(message, cause);
		// TODO Auto-generated constructor stub
	}

	/**
	 * @param message
	 * @param cause
	 * @param enableSuppression
	 * @param writableStackTrace
	 */
	public ClientException(String message, Throwable cause,
			boolean enableSuppression, boolean writableStackTrace) {
		super(message, cause, enableSuppression, writableStackTrace);
		// TODO Auto-generated constructor stub
	}

}
