package controller;

import java.util.List;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;

import bean.Curso;
import bean.Pregunta;
import generico.BaseController;
import generico.GenericoController;

@ManagedBean
@SessionScoped
public class PreguntaController extends BaseController implements GenericoController {
	
	private Curso curso;
	private List<Pregunta> listaPreguntas;
	private Pregunta pregunta;
	
	public PreguntaController() throws Exception {
		// TODO Constructor method stub
	}
	
	@Override
	public String init() throws Exception {
		listaPreguntas = getPreguntaService().listarPreguntasPorCurso(curso);
		return "pretty:pregunta_listado";
	}
	
	@Override
	public String buscar() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public String nuevo() throws Exception {
		pregunta = new Pregunta();
		return null;
	}

	@Override
	public String editar() throws Exception {
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
	public String guardar() throws Exception {
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
		// TODO Auto-generated method stub
		return null;
	}

	public List<Pregunta> getListaPreguntas() {
		return listaPreguntas;
	}

	public void setListaPreguntas(List<Pregunta> listaPreguntas) {
		this.listaPreguntas = listaPreguntas;
	}

	public Curso getCurso() {
		return curso;
	}

	public void setCurso(Curso curso) {
		this.curso = curso;
	}

	public Pregunta getPregunta() {
		return pregunta;
	}

	public void setPregunta(Pregunta pregunta) {
		this.pregunta = pregunta;
	}
	
}
