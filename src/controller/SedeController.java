package controller;

import java.util.List;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;


import bean.Sede;
import generico.BaseController;
import generico.GenericoController;

@ManagedBean
@SessionScoped
public class SedeController extends BaseController implements GenericoController {

	private List<Sede> listaSede;
	private Sede sede;
	
	public SedeController() {
		pantallaListado = "pretty:sede_listado";
		pantallaMantenimiento = "pretty:sede_mantenimiento";
	}
	
	@Override
	public String init() throws Exception {
		inicializarDatosMantenimiento();
		return pantallaListado;
	}

	@Override
	public String buscar() throws Exception {
		listaSede = getSedeService().listarTodos();
		return null;
	}

	@Override
	public String nuevo() throws Exception {
		sede = new Sede();
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
			getSedeService().registrar(sede);
			enviarMensajeExitoso("Éxito", "Se registró!");
		} else {
			getSedeService().actualizar(sede);
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
		getSedeService().eliminar(sede);
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
		listaSede = getSedeService().listarTodos();
		return null;
	}

	public List<Sede> getListaSede() {
		return listaSede;
	}

	public void setListaSede(List<Sede> listaSede) {
		this.listaSede = listaSede;
	}

	public Sede getSede() {
		return sede;
	}

	public void setSede(Sede sede) {
		this.sede = sede;
	}
	
}
