package controller;

import java.util.List;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;

import bean.Alumno;
import generico.BaseController;
import generico.GenericoController;

@ManagedBean
@SessionScoped
public class AlumnoController extends BaseController implements GenericoController{

	private List<Alumno> listaAlumno;
	private Alumno alumno;

	public AlumnoController(){
		pantallaListado = "pretty:alumno_listado";
		pantallaMantenimiento = "pretty:alumno_mantenimiento";
	}
	
	@Override
	public String init() throws Exception {
		inicializarDatosMantenimiento();
		return pantallaListado;
	}

	@Override
	public String buscar() throws Exception {
		listaAlumno = getAlumnoService().listarTodos();
		return null;
	}

	@Override
	public String nuevo() throws Exception {
		alumno = new Alumno();
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
		if(accionSolicitada.equals(AccionSolicitada.NUEVO)){
			alumno.getPk().setIdalumno("ALU-" + alumno.getNumerodocumento());
			getAlumnoService().registrar(alumno);
			enviarMensajeExitoso("Exito", "Se registro!");
		} else {
			getAlumnoService().actualizar(alumno);
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
		getAlumnoService().eliminar(alumno);
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
		listaAlumno = getAlumnoService().listarTodos();
		return null;
	}
	
	public List<Alumno> getListaAlumno() {
		return listaAlumno;
	}

	public void setListaAlumno(List<Alumno> listaAlumno) {
		this.listaAlumno = listaAlumno;
	}

	public Alumno getAlumno() {
		return alumno;
	}

	public void setAlumno(Alumno alumno) {
		this.alumno = alumno;
	}

}
