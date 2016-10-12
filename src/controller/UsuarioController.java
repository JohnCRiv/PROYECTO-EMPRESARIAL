package controller;

import java.util.List;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;

import bean.Rol;
import bean.Usuario;
import generico.BaseController;
import generico.GenericoController;

@ManagedBean
@SessionScoped
public class UsuarioController extends BaseController implements GenericoController{
	private List<Usuario> listaUsuario;
	private Usuario usuario;
	private List<Rol> listaRol;

	public UsuarioController(){
		pantallaListado = "pretty:usuario_listado";
		pantallaMantenimiento = "pretty:usuario_mantenimiento";
	}
	
	@Override
	public String init() throws Exception {
		inicializarDatosMantenimiento();
		return pantallaListado;
	}

	@Override
	public String buscar() throws Exception {
		listaUsuario = getUsuarioService().listarTodos();
		return null;
	}

	@Override
	public String nuevo() throws Exception {
		usuario = new Usuario();
		setAccionSolicitada(AccionSolicitada.NUEVO);
		return pantallaMantenimiento;
	}

	@Override
	public String editar() throws Exception {
		setAccionSolicitada(AccionSolicitada.EDITAR);
		return pantallaMantenimiento;
	}

	@Override
	public String guardar() throws Exception {
		if (accionSolicitada.equals(AccionSolicitada.NUEVO)) {
			getUsuarioService().registrar(usuario);
			enviarMensajeExitoso("Éxito", "Se registró!");
		} else {
			getUsuarioService().actualizar(usuario);
			enviarMensajeExitoso("Éxito", "Se actualizó!");
		}
		
		buscar();
		return pantallaListado;
	}

	@Override
	public String ver() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String eliminar() throws Exception {
		getUsuarioService().eliminar(usuario);
		buscar();
		enviarMensajeExitoso("Éxito", "Se eliminó!");
		return null;
	}

	@Override
	public String inactivar() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String salir() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Boolean validar() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String inicializarFiltrosListado() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String inicializarDatosMantenimiento() throws Exception {
		listaUsuario = getUsuarioService().listarTodos();
		listaRol = getRolService().listarTodos();
		return null;
	}

	public List<Usuario> getListaUsuario() {
		return listaUsuario;
	}

	public void setListaUsuario(List<Usuario> listaUsuario) {
		this.listaUsuario = listaUsuario;
	}

	public Usuario getUsuario() {
		return usuario;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}

	public List<Rol> getListaRol() {
		return listaRol;
	}

	public void setListaRol(List<Rol> listaRol) {
		this.listaRol = listaRol;
	}

}
