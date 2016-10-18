package controller;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;

import bean.Usuario;
import generico.BaseController;
import util.Constantes;
import util.Session;
import util.UsuarioActual;

import static util.Validador.*;

@ManagedBean
@SessionScoped
public class LoginController extends BaseController {

	private String usuario;
	private String clave;

	public LoginController() {}
	
	public String iniciarSesion() {
		
		Usuario user = getUsuarioService().iniciarSesion(usuario, clave);
		
		if (!esNulo(user)) {
			UsuarioActual usuarioActual = new UsuarioActual();
			usuarioActual.setNombres(user.getNombres());
			usuarioActual.setApellidopaterno(user.getApellidopaterno());
			usuarioActual.setApellidomaterno(user.getApellidomaterno());
			usuarioActual.setNumerodocumento(user.getNumerodocumento());
			usuarioActual.setIdrol(user.getRol().getPk().getIdrol().toString());
			usuarioActual.setNombrerol(user.getRol().getRol());
			usuarioActual.setEnlaces(getEnlaceService().obtenerEnlacesPorRol(user.getRol()));
			Session.setSessionValue(Constantes.USUARIO_ACTUAL, usuarioActual);
			return Constantes.BIENVENIDA;
		}
		
		this.ejecutar("$('.notifyjs-corner').remove();");
		enviarMensajeError("Credenciales Inválidas", "Usuario o contraseña incorrecto");
		
		return null;
		
	}
	
	public String cerrarSesion() {
		Session.removeSessionValue(Constantes.USUARIO_ACTUAL);
		return Constantes.LOGIN;
	}

	public String getUsuario() {
		return usuario;
	}

	public void setUsuario(String usuario) {
		this.usuario = usuario;
	}

	public String getClave() {
		return clave;
	}

	public void setClave(String clave) {
		this.clave = clave;
	}

}
