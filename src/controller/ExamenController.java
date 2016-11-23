package controller;

import java.util.ArrayList;
import java.util.List;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;

import bean.Curso;
import bean.Examen;
import bean.Pregunta;
import dto.DtoPregunta;
import generico.BaseController;
import generico.GenericoController;
import util.Validador;

@ManagedBean
@SessionScoped
public class ExamenController extends BaseController implements GenericoController {
	
	private Examen examen;
	private String conLimiteTiempo;
	private String conFechaFin;
	private Curso curso;
	private List<DtoPregunta> listaPreguntasExamen;
	private DtoPregunta pregunta;
	private List<Pregunta> listaPreguntas;
	private Pregunta preguntaSeleccionada;
	
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
		inicializarDatosMantenimiento();
		return pantallaMantenimiento;
	}

	@Override
	public String editar() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String guardar() throws Exception {
		
		if (!validar())
			return null;
		
		getExamenService().registrarExamen(examen, curso, listaPreguntasExamen);
		enviarMensajeExitoso("Éxito", "Se registró el examen correctamente");
		
		return "pretty:cursos_docente";
	}
	
	public String agregarPregunta() {
		
		if (!esPreguntaRepetida()) {
			DtoPregunta dto = new DtoPregunta();
			dto.setIdpregunta(preguntaSeleccionada.getPk().getIdpregunta());
			dto.setDescripcion(preguntaSeleccionada.getDescripcion());
			dto.setPuntaje(0);
			listaPreguntasExamen.add(dto);
			enviarMensajeExitoso("Éxito", "La pregunta " + preguntaSeleccionada.getDescripcion() + " se agregó correctamente.");
		} else {
			this.ejecutar("$('.notifyjs-corner').remove();");
			enviarMensajeError("Error", "La pregunta " + preguntaSeleccionada.getDescripcion() + " ya se encuentra asignada.");
		}
		
		return null;
	}
	
	public String eliminarPregunta() {
		listaPreguntasExamen.remove(pregunta);
		enviarMensajeExitoso("Éxito", "La pregunta " + preguntaSeleccionada.getDescripcion() + " se eliminó correctamente.");
		return null;
	}
	
	private Boolean esPreguntaRepetida() {
		for (DtoPregunta dtoPregunta : listaPreguntasExamen)
			if (dtoPregunta.getIdpregunta().equals(preguntaSeleccionada.getPk().getIdpregunta()))
				return true;
		
		return false;
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
		
		Integer totalPuntaje = 0;
		for (DtoPregunta dtoPregunta : listaPreguntasExamen) {
			if (dtoPregunta.getPuntaje() <= 0) {
				enviarMensajeError("Error", "Las preguntas deben tener puntaje positivo mayor que cero.");
				return false;
			} else {
				totalPuntaje += dtoPregunta.getPuntaje();
			}
		}
		
		if (totalPuntaje != 20) {
			enviarMensajeError("Error", "Las preguntas deben tener un puntaje acumulado de 20.");
			return false;
		}
		
		if (conFechaFin.equalsIgnoreCase("S")) {
			if (Validador.esNulo(examen.getFechafin())) {
				enviarMensajeError("Error", "Debe indicar la fecha de fin del exámen");
				return false;
			}
		}
		
		return true;
	}

	@Override
	public String inicializarFiltrosListado() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String inicializarDatosMantenimiento() throws Exception {
		examen = new Examen();
		listaPreguntasExamen = new ArrayList<>();
		listaPreguntas = getPreguntaService().listarPreguntasPorCurso(curso);
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

	public Curso getCurso() {
		return curso;
	}

	public void setCurso(Curso curso) {
		this.curso = curso;
	}

	public List<DtoPregunta> getListaPreguntasExamen() {
		return listaPreguntasExamen;
	}

	public void setListaPreguntasExamen(List<DtoPregunta> listaPreguntasExamen) {
		this.listaPreguntasExamen = listaPreguntasExamen;
	}

	public DtoPregunta getPregunta() {
		return pregunta;
	}

	public void setPregunta(DtoPregunta pregunta) {
		this.pregunta = pregunta;
	}

	public List<Pregunta> getListaPreguntas() {
		return listaPreguntas;
	}

	public void setListaPreguntas(List<Pregunta> listaPreguntas) {
		this.listaPreguntas = listaPreguntas;
	}

	public Pregunta getPreguntaSeleccionada() {
		return preguntaSeleccionada;
	}

	public void setPreguntaSeleccionada(Pregunta preguntaSeleccionada) {
		this.preguntaSeleccionada = preguntaSeleccionada;
	}
	
}
