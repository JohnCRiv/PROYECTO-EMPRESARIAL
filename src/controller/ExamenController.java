package controller;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;

import bean.Examen;
import generico.BaseController;
import generico.GenericoController;

@ManagedBean
@SessionScoped
public class ExamenController extends BaseController implements GenericoController {
	
	private Examen examen;
	private String conLimiteTiempo;
	private String conFechaFin;
	
	public ExamenController() {
		pantallaMantenimiento = "pretty:examen_mantenimiento";
	}
	
	@Override
	public String init() throws Exception {
		return null;
	}

	@Override
	public String buscar() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String nuevo() throws Exception {
		setAccionSolicitada(AccionSolicitada.NUEVO);
		return pantallaMantenimiento;
	}

	@Override
	public String editar() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String guardar() throws Exception {
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
		return null;
	}

	public Examen getExamen() {
		return examen;
	}

	public void setExamen(Examen examen) {
		this.examen = examen;
	}

	public String getConLimiteTiempo() {
		return conLimiteTiempo;
	}

	public void setConLimiteTiempo(String conLimiteTiempo) {
		this.conLimiteTiempo = conLimiteTiempo;
	}

	public String getConFechaFin() {
		return conFechaFin;
	}

	public void setConFechaFin(String conFechaFin) {
		this.conFechaFin = conFechaFin;
	}
	
}
