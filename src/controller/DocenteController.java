package controller;

import java.util.List;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;

import bean.Docente;
import bean.Sede;
import generico.BaseController;
import generico.GenericoController;

@ManagedBean
@SessionScoped
public class DocenteController extends BaseController implements GenericoController {

	private List<Docente> listaDocente;
	private Docente docente;
	private List<Sede> listaSede;
	
	public DocenteController() {
		pantallaListado = "docente_listado";
		pantallaMantenimiento = "docente_mantenimiento";
	}
	
	@Override
	public String init() throws Exception {
		inicializarDatosMantenimiento();
		return pantallaListado;
	}

	@Override
	public String buscar() throws Exception {
		listaDocente = getDocenteService().listarTodos();
		return null;
	}

	@Override
	public String nuevo() throws Exception {
		docente = new Docente();
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
			getDocenteService().registrar(docente);
			enviarMensajeExitoso("Éxito", "Se registró!");
		} else {
			getDocenteService().actualizar(docente);
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
		getDocenteService().eliminar(docente);
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
		listaDocente = getDocenteService().listarTodos();
		listaSede = getSedeService().listarTodos();
		return null;
	}

	public List<Docente> getListaDocente() {
		return listaDocente;
	}

	public void setListaDocente(List<Docente> listaDocente) {
		this.listaDocente = listaDocente;
	}

	public Docente getDocente() {
		return docente;
	}

	public void setDocente(Docente docente) {
		this.docente = docente;
	}

	public List<Sede> getListaSede() {
		return listaSede;
	}

	public void setListaSede(List<Sede> listaSede) {
		this.listaSede = listaSede;
	}
	
}
