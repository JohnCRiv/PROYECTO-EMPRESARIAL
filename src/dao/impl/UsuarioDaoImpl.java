package dao.impl;

import java.util.Arrays;
import java.util.List;

import bean.Usuario;
import dao.UsuarioDao;
import generico.GenericoDaoImpl;
import util.Parametro;

public class UsuarioDaoImpl extends GenericoDaoImpl<Usuario> implements UsuarioDao {

	@Override
	public Usuario iniciarSesion(String usuario, String clave) {
		List<Parametro> parametros = Arrays.asList(
				new Parametro("usuario", usuario),
				new Parametro("clave", clave));
		
		List<Usuario> listaUsuario = this.listarPorWhereQuery("entity.usuario = :usuario and entity.clave = :clave", parametros);
		if (!listaUsuario.isEmpty())
			return listaUsuario.get(0);
		else
			return null;
	}
	
}
