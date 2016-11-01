package controller;

import java.util.List;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;

import bean.Alumno;
import bean.Curso;
import generico.BaseController;
import generico.GenericoController;

@ManagedBean
@SessionScoped
public class AlumnoController extends BaseController implements GenericoController{

	private List<Alumno> listaAlumno;
	private Alumno alumno;
	private List<Curso> listaCursos;
	private List<Curso> listaAlumnoCursos;
	private Curso curso;

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
	
	public String iniciarAsignacionCurso() {
		listaAlumnoCursos = getAlumnoCursoService().obtenerCursosAsignados(alumno);
		listaCursos = getCursoService().listarTodos();
		return "pretty:alumno_asignar_cursos";
	}
	
	public String agregarCurso() {
		if (!esCursoRepetido()) {
			listaAlumnoCursos.add(curso);
			enviarMensajeExitoso("Éxito", "El curso " + curso.getDescripcion() + " se agregó correctamente.");
		} else {
			this.ejecutar("$('.notifyjs-corner').remove();");
			enviarMensajeError("Error", "El curso " + curso.getDescripcion() + " ya se encuentra asignado.");
		}
		return null;
	}
	
	public String eliminarCurso() {
		listaAlumnoCursos.remove(curso);
		enviarMensajeExitoso("Éxito", "El curso " + curso.getDescripcion() + " se eliminó correctamente.");
		return null;
	}
	
	public Boolean esCursoRepetido() {
		for (Curso curso : listaAlumnoCursos) 
			if (curso.getPk().getIdcurso().equals(this.curso.getPk().getIdcurso())) 
				return true;
		
		return false;
	}
	
	public String guardarAsignacionCursos() {
		getAlumnoService().guardarAsignacionCurso(alumno, listaAlumnoCursos);
		enviarMensajeExitoso("Éxito", "Se registró correctamente.");
		return pantallaListado;
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

	public List<Curso> getListaCursos() {
		return listaCursos;
	}

	public void setListaCursos(List<Curso> listaCursos) {
		this.listaCursos = listaCursos;
	}

	public List<Curso> getListaAlumnoCursos() {
		return listaAlumnoCursos;
	}

	public void setListaAlumnoCursos(List<Curso> listaAlumnoCursos) {
		this.listaAlumnoCursos = listaAlumnoCursos;
	}

	public Curso getCurso() {
		return curso;
	}

	public void setCurso(Curso curso) {
		this.curso = curso;
	}
	
}
