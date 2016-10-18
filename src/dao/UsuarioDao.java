package dao;

import bean.Usuario;
import generico.GenericoDao;

public interface UsuarioDao extends GenericoDao<Usuario> {
	
	public Usuario iniciarSesion(String usuario, String clave);
	
}
