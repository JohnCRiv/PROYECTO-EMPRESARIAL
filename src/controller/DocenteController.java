package controller;

import java.util.List;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;

import bean.Curso;
import bean.Docente;
import bean.DocenteCurso;
import bean.Sede;
import generico.BaseController;
import generico.GenericoController;

@ManagedBean
@SessionScoped
public class DocenteController extends BaseController implements GenericoController {

	private List<Docente> listaDocente;
	private Docente docente;
	private List<Sede> listaSede;
	private List<Curso> listaCursos;
	private List<Curso> listaCursosDocente;
	private Curso curso;
	
	public DocenteController() {
		pantallaListado = "pretty:docente_listado";
		pantallaMantenimiento = "pretty:docente_mantenimiento";
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
	
	public String iniciarAsignacionCurso() {
		listaCursosDocente = getDocenteCursoService().obtenerCursosAsignados(docente);
		listaCursos = getCursoService().listarTodos();
		return "pretty:docente_asignar_cursos";
	}
	
	public String buscarCursos() {
		return null;
	}
	
	public String agregarCurso() {
		if (!esCursoRepetido()) {
			listaCursosDocente.add(curso);
			enviarMensajeExitoso("Éxito", "El curso " + curso.getDescripcion() + " se agregó correctamente.");
		} else {
			this.ejecutar("$('.notifyjs-corner').remove();");
			enviarMensajeError("Error", "El curso " + curso.getDescripcion() + " ya se encuentra asignado.");
		}
		return null;
	}
	
	public String eliminarCurso() {
		listaCursosDocente.remove(curso);
		enviarMensajeExitoso("Éxito", "El curso " + curso.getDescripcion() + " se eliminó de la lista correctamente.");
		return null;
	}
	
	public Boolean esCursoRepetido() {
		for (Curso curso : listaCursosDocente) 
			if (curso.getPk().getIdcurso().equals(this.curso.getPk().getIdcurso())) 
				return true;
		
		return false;
	}
	
	public String guardarAsignacionCursos() throws Exception {
		getDocenteService().guardarAsignacionCurso(docente, listaCursosDocente);
		enviarMensajeExitoso("Éxito", "Se registró correctamente.");
		buscar();
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

	public List<Curso> getListaCursos() {
		return listaCursos;
	}

	public void setListaCursos(List<Curso> listaCursos) {
		this.listaCursos = listaCursos;
	}

	public List<Curso> getListaCursosDocente() {
		return listaCursosDocente;
	}

	public void setListaCursosDocente(List<Curso> listaCursosDocente) {
		this.listaCursosDocente = listaCursosDocente;
	}

	public Curso getCurso() {
		return curso;
	}

	public void setCurso(Curso curso) {
		this.curso = curso;
	}
	
}
