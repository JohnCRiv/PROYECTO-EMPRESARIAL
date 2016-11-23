package controller;

import java.util.List;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;

import bean.Curso;
import bean.Examen;
import bean.ExamenPregunta;
import bean.Pregunta;
import bean.PreguntaOpcion;
import bean.pk.PreguntaPK;
import generico.BaseController;
import generico.GenericoController;
import util.Validador;

@ManagedBean
@SessionScoped
public class ExamenVirtualController extends BaseController implements GenericoController {
	
	private Examen examen;
	private Curso curso;
	private List<ExamenPregunta> listaPreguntas;
	private Integer segundos;
	
	public ExamenVirtualController() throws Exception {
		pantallaListado = "pretty:rendir_examen";
	}
	
	@Override
	public String init() throws Exception {
		inicializarDatosMantenimiento();
		return pantallaListado;
	}
	
	@Override
	public String inicializarDatosMantenimiento() throws Exception {
		listaPreguntas = getExamenPreguntaService().listarPreguntas(
				curso.getPk().getIdcurso(), examen.getPk().getIdexamen());
		if (!Validador.esNulo(examen.getDuracion()))
			segundos = examen.getDuracion() * 60;
		else
			segundos = 0;
		return null;
	}
	
	public List<PreguntaOpcion> listarOpciones(Integer idcurso, Integer idpregunta) {
		return getPreguntaOpcionService().listarOpciones(idcurso, idpregunta);
	}
	
	public Pregunta obtenerPregunta(Integer idpregunta) {
		PreguntaPK pk = new PreguntaPK();
		pk.setIdpregunta(idpregunta);
		return getPreguntaService().buscar(pk);
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
		enviarMensajeInformacion("", "El tiempo del examen ha terminado");
		return "pretty:cursos_alumno";
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

	public Examen getExamen() {
		return examen;
	}

	public void setExamen(Examen examen) {
		this.examen = examen;
	}

	public List<ExamenPregunta> getListaPreguntas() {
		return listaPreguntas;
	}

	public void setListaPreguntas(List<ExamenPregunta> listaPreguntas) {
		this.listaPreguntas = listaPreguntas;
	}

	public Integer getSegundos() {
		return segundos;
	}

	public void setSegundos(Integer segundos) {
		this.segundos = segundos;
	}

	public Curso getCurso() {
		return curso;
	}

	public void setCurso(Curso curso) {
		this.curso = curso;
	}
	
}
