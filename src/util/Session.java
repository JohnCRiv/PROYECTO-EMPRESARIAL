package util;

import javax.faces.context.FacesContext;
import javax.servlet.http.HttpSession;

public abstract class Session {
	
	private static final HttpSession httpSession = (HttpSession) FacesContext.getCurrentInstance().getExternalContext().getSession(false);
	
	public static void setSessionValue(String key, Object value) {
		httpSession.setAttribute(key, value);
	}
	
	public static Object getSessionValue(String key) {
		return httpSession.getAttribute(key);
	}
	
	public static void removeSessionValue(String key) {
		httpSession.removeAttribute(key);
	}
	
}
