package controller;

import java.util.List;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;

import bean.Enlace;
import bean.Rol;
import bean.RolEnlace;
import generico.BaseController;
import generico.GenericoController;

@ManagedBean
@SessionScoped
public class RolController extends BaseController implements GenericoController {

	private List<Rol> listaRol;
	private Rol rol;
	private List<Enlace> listaEnlace;

	public RolController() {
		pantallaListado = "pretty:rol_listado";
		pantallaMantenimiento = "pretty:rol_mantenimiento";
	}

	@Override
	public String init() throws Exception {
		inicializarDatosMantenimiento();
		return pantallaListado;
	}

	@Override
	public String buscar() throws Exception {
		listaRol = getRolService().listarTodos();
		return null;
	}

	@Override
	public String nuevo() throws Exception {
		rol = new Rol();
		reiniciarListaEnlace();
		setAccionSolicitada(AccionSolicitada.NUEVO);
		return pantallaMantenimiento;
	}

	@Override
	public String editar() throws Exception {
		setAccionSolicitada(AccionSolicitada.EDITAR);
		reiniciarListaEnlace();
		List<RolEnlace> listaRolEnlace = rol.getRolenlace();
		for (RolEnlace rolEnlace : listaRolEnlace) {
			for (Enlace enlace : listaEnlace) {
				if (rolEnlace.getPk().getIdenlace().equals(enlace.getPk().getIdenlace()))
					enlace.setSeleccionado(true);
			}
		}
		return pantallaMantenimiento;
	}

	@Override
	public String guardar() throws Exception {
		if (accionSolicitada.equals(AccionSolicitada.NUEVO)) {
			getRolService().registrar(rol);
			Rol ultimoRol = getRolService().obtenerRolMaxID();
			getRolEnlaceService().registrarRolEnlace(ultimoRol, listaEnlace);
			enviarMensajeExitoso("Exito", "Se registró");
		} else {
			getRolService().actualizar(rol);
			getRolEnlaceService().eliminarSegunRol(rol);
			getRolEnlaceService().registrarRolEnlace(rol, listaEnlace);
			enviarMensajeExitoso("Exito", "Se Actualizó");
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
		getRolService().eliminar(rol);
		buscar();
		enviarMensajeExitoso("Exito", "Se Eliminó");
		return null;
	}
	
	private void reiniciarListaEnlace() {
		listaEnlace = getEnlaceService().listarTodos();
		for (Enlace enlace : listaEnlace) {
			enlace.setSeleccionado(false);
		}
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
		listaRol = getRolService().listarTodos();
		listaEnlace = getEnlaceService().listarTodos();
		return null;
	}
	
	public List<Rol> getListaRol() {
		return listaRol;
	}

	public void setListaRol(List<Rol> listaRol) {
		this.listaRol = listaRol;
	}

	public Rol getRol() {
		return rol;
	}

	public void setRol(Rol rol) {
		this.rol = rol;
	}

	public List<Enlace> getListaEnlace() {
		return listaEnlace;
	}

	public void setListaEnlace(List<Enlace> listaEnlace) {
		this.listaEnlace = listaEnlace;
	}
	
}
