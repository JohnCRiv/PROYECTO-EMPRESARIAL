package servicio;

import bean.Usuario;
import generico.GenericoService;

public interface UsuarioService extends GenericoService<Usuario> {

	public Usuario iniciarSesion(String usuario, String clave);
	
}
