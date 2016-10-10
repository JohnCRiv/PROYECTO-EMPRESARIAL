package controller;

import java.util.List;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;

import bean.Enlace;
import bean.Rol;
import generico.BaseController;
import generico.GenericoController;

@ManagedBean
@SessionScoped
public class EnlaceController extends BaseController implements GenericoController {

	private List<Enlace> listaEnlace;
	private Enlace enlace;
	private List<Rol> listaRol;
	
	
	public EnlaceController() {
		pantallaListado = "enlace_listado";
		pantallaMantenimiento = "enlace_mantenimiento";
	}
	
	@Override
	public String init() throws Exception {
		inicializarDatosMantenimiento();
		return pantallaListado;
	}

	@Override
	public String buscar() throws Exception {
		listaEnlace = getEnlaceService().listarTodos();
		return null;
	}

	@Override
	public String nuevo() throws Exception {
		enlace = new Enlace();
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
			getEnlaceService().registrar(enlace);
			enviarMensajeExitoso("Éxito", "Se registró!");
		} else {
			getEnlaceService().actualizar(enlace);
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
		getEnlaceService().eliminar(enlace);
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
		listaEnlace = getEnlaceService().listarTodos();
		listaRol = getRolService().listarTodos();
		return null;
	}

	public List<Enlace> getListaEnlace() {
		return listaEnlace;
	}

	public void setListaEnlace(List<Enlace> listaEnlace) {
		this.listaEnlace = listaEnlace;
	}

	public Enlace getEnlace() {
		return enlace;
	}

	public void setEnlace(Enlace enlace) {
		this.enlace = enlace;
	}

	public List<Rol> getListaRol() {
		return listaRol;
	}

	public void setListaRol(List<Rol> listaRol) {
		this.listaRol = listaRol;
	}

	
	
}
