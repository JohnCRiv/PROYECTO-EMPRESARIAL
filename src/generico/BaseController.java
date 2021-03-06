package generico;

import java.util.ArrayList;
import java.util.List;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;

import org.primefaces.context.RequestContext;

import generico.GenericoController.AccionSolicitada;
import servicio.AlumnoCursoService;
import servicio.AlumnoExamenService;
import servicio.AlumnoRespuestaService;
import servicio.AlumnoService;
import servicio.CursoExamenService;
import servicio.CursoPreguntaService;
import servicio.CursoService;
import servicio.DocenteCursoService;
import servicio.DocenteService;
import servicio.EnlaceService;
import servicio.ExamenPreguntaService;
import servicio.ExamenService;
import servicio.PreguntaOpcionService;
import servicio.PreguntaService;
import servicio.RolEnlaceService;
import servicio.RolService;
import servicio.SedeService;
import servicio.UsuarioService;
import servicio.impl.AlumnoCursoServiceImpl;
import servicio.impl.AlumnoExamenServiceImpl;
import servicio.impl.AlumnoRespuestaServiceImpl;
import servicio.impl.AlumnoServiceImpl;
import servicio.impl.CursoExamenServiceImpl;
import servicio.impl.CursoPreguntaServiceImpl;
import servicio.impl.CursoServiceImpl;
import servicio.impl.DocenteCursoServiceImpl;
import servicio.impl.DocenteServiceImpl;
import servicio.impl.EnlaceServiceImpl;
import servicio.impl.ExamenPreguntaServiceImpl;
import servicio.impl.ExamenServiceImpl;
import servicio.impl.PreguntaOpcionServiceImpl;
import servicio.impl.PreguntaServiceImpl;
import servicio.impl.RolEnlaceServiceImpl;
import servicio.impl.RolServiceImpl;
import servicio.impl.SedeServiceImpl;
import servicio.impl.UsuarioServiceImpl;
import util.Constantes;
import util.MensajeUsuario;
import util.MensajeUsuario.TipoMensaje;
import util.Session;
import util.UsuarioActual;

@ManagedBean
@SessionScoped
public abstract class BaseController {
	
	protected String pantallaListado;
	protected String pantallaMantenimiento;
	protected AccionSolicitada accionSolicitada;
	protected List<MensajeUsuario> mensajes;
	
	protected BaseController() {
		mensajes = new ArrayList<>();
	}
	
	private enum TipoNotificacion {
		success, error, info, warning
	}
	
	/**
	 * <strong>Ejecutar</strong> <br>
	 * Ejecuta una sentencia de tipo JavaScript
	 * desde la controladora.
	 * 
	 * @author CruzadoJ
	 * 
	 * @param javascript
	 * 			Sentencia JavaScript.
	 */
	protected void ejecutar(String javascript) {
		RequestContext.getCurrentInstance().execute(javascript);
	}
	
	private void enviarMensaje(TipoNotificacion tipoNotificacion, String titulo, String mensaje) {
		this.ejecutar("$.Notification.notify('" + tipoNotificacion + "','top right','" + titulo + "','" + mensaje + "')");
	}
	
	/**
	 * <strong>Enviar Mensaje Exitoso</strong> <br>
	 * Env�a un mensaje de tipo exitoso.
	 * 
	 * @author CruzadoJ
	 * 
	 * @param titulo
	 * 			T�tulo del mensaje.
	 * @param mensaje
	 * 			Mensaje.
	 */
	protected void enviarMensajeExitoso(String titulo, String mensaje) {
		this.ejecutar("$('.notifyjs-corner').remove();");
		this.enviarMensaje(TipoNotificacion.success, titulo, mensaje);
	}
	
	/**
	 * <strong>Enviar Mensaje Informaci�n</strong> <br>
	 * Env�a un mensaje de tipo informaci�n.
	 * 
	 * @author CruzadoJ
	 * 
	 * @param titulo
	 * 			T�tulo del mensaje.
	 * @param mensaje
	 * 			Mensaje.
	 */
	protected void enviarMensajeInformacion(String titulo, String mensaje) {
		this.enviarMensaje(TipoNotificacion.info, titulo, mensaje);
	}
	
	/**
	 * <strong>Enviar Mensaje Error</strong> <br>
	 * Env�a un mensaje de tipo error.
	 * 
	 * @author CruzadoJ
	 * 
	 * @param titulo
	 * 			T�tulo del mensaje.
	 * @param mensaje
	 * 			Mensaje.
	 */
	protected void enviarMensajeError(String titulo, String mensaje) {
		this.enviarMensaje(TipoNotificacion.error, titulo, mensaje);
	}
	
	/**
	 * <strong>Enviar Mensaje Advertencia</strong> <br>
	 * Env�a un mensaje de tipo advertencia.
	 * 
	 * @author CruzadoJ
	 * 
	 * @param titulo
	 * 			T�tulo del mensaje.
	 * @param mensaje
	 * 			Mensaje.
	 */
	protected void enviarMensajeAdvertencia(String titulo, String mensaje) {
		this.enviarMensaje(TipoNotificacion.warning, titulo, mensaje);
	}
	
	/**
	 * <strong>Mostrar Mensajes Usuario</strong> <br>
	 * Muestra los mensajes de tipo : <br>
	 * <ul>
	 *  <li>Informaci�n</li>
	 *  <li>Error</li>
	 *  <li>Advertencia</li>
	 * <ul>
	 * <br>
	 * 
	 * @author CruzadoJ
	 * 
	 */
	protected void mostrarMensajesUsuario() {
		if (this.mensajes == null)
			return;
		
		this.ejecutar("$('.notifyjs-corner').remove();");
		
		for (MensajeUsuario msg : this.mensajes) {
			
			if (msg.getTipoMensaje() == null)
				this.enviarMensajeInformacion(msg.getTitulo(), msg.getMensaje());
			
			if (msg.getTipoMensaje().equals(MensajeUsuario.TipoMensaje.INFORMACION))
				this.enviarMensajeInformacion(msg.getTitulo(), msg.getMensaje());
			
			if (msg.getTipoMensaje().equals(MensajeUsuario.TipoMensaje.ERROR))
				this.enviarMensajeError(msg.getTitulo(), msg.getMensaje());
			
			if (msg.getTipoMensaje().equals(MensajeUsuario.TipoMensaje.ADVERTENCIA))
				this.enviarMensajeAdvertencia(msg.getTitulo(), msg.getMensaje());
			
		}
	}
	
	/**
	 * <strong>Error</strong> <br>
	 * Crea un objeto {@link MensajeUsuario} de tipo
	 * ERROR por defecto y lo agrega a la lista de mensajes.
	 * 
	 * @author CruzadoJ
	 * 
	 * @param mensaje
	 * 			Mensaje de el error.
	 */
	protected void error(String mensaje) {
		mensajes.add(new MensajeUsuario(TipoMensaje.ERROR, mensaje));
	}
	
	/**
	 * <strong>Set Session Value</strong> <br>
	 * Crea un objeto en sesi�n.
	 * 
	 * @author CruzadoJ
	 * 
	 * @param key
	 * 			Clave del objeto en sesi�n.
	 * @param value
	 * 			Valor del objeto en sesi�n.
	 */
	protected void setSessionValue(String key, Object value) {
		Session.setSessionValue(key, value);
	}
	
	/**
	 * <strong>Get Session Value</strong> <br>
	 * Obtiene un objeto de sesi�n.
	 * 
	 * @author CruzadoJ
	 * 
	 * @param key
	 * 			Clave del objeto en sesi�n.
	 * 
	 * @return {@link Object} Objeto de la sesi�n.
	 */
	protected Object getSessionValue(String key) {
		return Session.getSessionValue(key);
	}
	
	/**
	 * <strong>Remove Session Value</strong> <br>
	 * Elimina un objeto de sesi�n.
	 * 
	 * @author CruzadoJ
	 * 
	 * @param key
	 * 			Clave del objeto en sesi�n.
	 */
	protected void removeSessionValue(String key) {
		Session.removeSessionValue(key);
	}
	
	/**
	 * <strong>Get Usuario Actual</strong> <br>
	 * Obtiene el Usuario Actual logeado.
	 * 
	 * @author CruzadoJ
	 * 
	 * @return {@link UsuarioActual} Usuario Actual.
	 */
	public UsuarioActual getUsuarioActual() {
		return (UsuarioActual) this.getSessionValue(Constantes.USUARIO_ACTUAL);
	}
	
	public AccionSolicitada getAccionSolicitada() {
		return accionSolicitada;
	}
	
	public void setAccionSolicitada(AccionSolicitada accionSolicitada) {
		this.accionSolicitada = accionSolicitada;
	}
	
	protected List<MensajeUsuario> getMensajes() {
		return mensajes;
	}

	protected void setMensajes(List<MensajeUsuario> mensajes) {
		this.mensajes = mensajes;
	}

	/** SERVICIOS **/
	
	protected AlumnoService getAlumnoService() {
		return AlumnoServiceImpl.getInstance();
	}
	
	protected CursoService getCursoService() {
		return CursoServiceImpl.getInstance();
	}
	
	protected AlumnoCursoService getAlumnoCursoService() {
		return AlumnoCursoServiceImpl.getInstance();
	}
	
	protected ExamenService getExamenService() {
		return ExamenServiceImpl.getInstance();
	}
	
	protected CursoExamenService getCursoExamenService() {
		return CursoExamenServiceImpl.getInstance();
	}
	
	protected AlumnoExamenService getAlumnoExamenService() {
		return AlumnoExamenServiceImpl.getInstance();
	}
	
	protected PreguntaService getPreguntaService() {
		return PreguntaServiceImpl.getInstance();
	}
	
	protected CursoPreguntaService getCursoPreguntaService() {
		return CursoPreguntaServiceImpl.getInstance();
	}
	
	protected ExamenPreguntaService getExamenPreguntaService() {
		return ExamenPreguntaServiceImpl.getInstance();
	}
	
	protected PreguntaOpcionService getPreguntaOpcionService() {
		return PreguntaOpcionServiceImpl.getInstance();
	}
	
	protected AlumnoRespuestaService getAlumnoRespuestaService() {
		return AlumnoRespuestaServiceImpl.getInstance();
	}
	
	protected RolService getRolService() {
		return RolServiceImpl.getInstance();
	}
	
	protected UsuarioService getUsuarioService() {
		return UsuarioServiceImpl.getInstance();
	}
	
	protected EnlaceService getEnlaceService() {
		return EnlaceServiceImpl.getInstance();
	}
	
	protected RolEnlaceService getRolEnlaceService() {
		return RolEnlaceServiceImpl.getInstance();
	}
	
	protected DocenteService getDocenteService() {
		return DocenteServiceImpl.getInstance();
	}
	
	protected DocenteCursoService getDocenteCursoService() {
		return DocenteCursoServiceImpl.getInstance();
	}
	
	protected SedeService getSedeService() {
		return SedeServiceImpl.getInstance();
	}
	
}