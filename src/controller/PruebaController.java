package controller;

import java.util.List;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;

import bean.Rol;
import bean.TipoDocumento;
import bean.Usuario;
import generico.BaseController;
import generico.GenericoController;

@ManagedBean
@SessionScoped
public class PruebaController extends BaseController implements GenericoController {
	
	private List<Usuario> listaUsuario;
	private List<Rol> listaRol;
	private List<TipoDocumento> listaDocumentos;
	private Usuario usuario;
	
	public PruebaController() throws Exception {
		init();
	}
	
	@Override
	public String init() throws Exception {
		inicializarDatosMantenimiento();
		return null;
	}
	
	@Override
	public String buscar() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public String nuevo() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String editar() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String ver() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String eliminar() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String inactivar() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public String guardar() throws Exception {
		Thread.sleep(3000);
		enviarMensajeExitoso("Registro exitoso!", "El usuario " + usuario.getNombres() + " se registró correctamente.");
		usuario = new Usuario();
		return null;
	}
	
	@Override
	public String salir() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Boolean validar() throws Exception {
		mensajes.clear();
		// TODO Auto-generated method stub
		return mensajes.isEmpty();
	}

	@Override
	public String inicializarFiltrosListado() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String inicializarDatosMantenimiento() throws Exception {
		usuario = new Usuario();
		listaDocumentos = getTipoDocumentoService().listarTodos();
		listaRol = getRolService().listarTodos();
		return null;
	}
	
	public List<Usuario> getListaUsuario() {
		return listaUsuario;
	}

	public void setListaUsuario(List<Usuario> listaUsuario) {
		this.listaUsuario = listaUsuario;
	}

	public List<Rol> getListaRol() {
		return listaRol;
	}

	public void setListaRol(List<Rol> listaRol) {
		this.listaRol = listaRol;
	}

	public List<TipoDocumento> getListaDocumentos() {
		return listaDocumentos;
	}

	public void setListaDocumentos(List<TipoDocumento> listaDocumentos) {
		this.listaDocumentos = listaDocumentos;
	}

	public Usuario getUsuario() {
		return usuario;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}
	
}
