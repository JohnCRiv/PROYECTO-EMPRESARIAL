package controller;

import java.util.ArrayList;
import java.util.List;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;

import bean.Curso;
import bean.CursoExamen;
import bean.Examen;
import bean.pk.ExamenPK;
import generico.BaseController;
import generico.GenericoController;

@ManagedBean
@SessionScoped
public class CursoPortalController extends BaseController implements GenericoController {
	
	private Curso curso;
	private List<CursoExamen> listaCursoExamen;
	private List<Examen> listaExamenesProgramados;
	private List<Examen> listaExamenesEnCurso;
	
	public CursoPortalController() {
		pantallaListado = "pretty:curso_portal";
	}
	
	@Override
	public String init() throws Exception {
		inicializarDatosMantenimiento();
		return pantallaListado;
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
		listaExamenesProgramados = new ArrayList<>();
		listaCursoExamen = getCursoExamenService().listarExamenesProgramados(curso);
		for (CursoExamen cursoExamen : listaCursoExamen) {
			ExamenPK pk = new ExamenPK();
			pk.setIdexamen(cursoExamen.getPk().getIdexamen());
			Examen examen = getExamenService().buscar(pk);
			listaExamenesProgramados.add(examen);
		}
		listaExamenesEnCurso = getCursoExamenService().listarExamenesEnCurso(curso);
		return null;
	}

	public Curso getCurso() {
		return curso;
	}

	public void setCurso(Curso curso) {
		this.curso = curso;
	}

	public List<CursoExamen> getListaCursoExamen() {
		return listaCursoExamen;
	}

	public void setListaCursoExamen(List<CursoExamen> listaCursoExamen) {
		this.listaCursoExamen = listaCursoExamen;
	}

	public List<Examen> getListaExamenesProgramados() {
		return listaExamenesProgramados;
	}

	public void setListaExamenesProgramados(List<Examen> listaExamenesProgramados) {
		this.listaExamenesProgramados = listaExamenesProgramados;
	}

	public List<Examen> getListaExamenesEnCurso() {
		return listaExamenesEnCurso;
	}

	public void setListaExamenesEnCurso(List<Examen> listaExamenesEnCurso) {
		this.listaExamenesEnCurso = listaExamenesEnCurso;
	}
	
}
