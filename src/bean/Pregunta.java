package bean;

import java.util.List;

import bean.pk.PreguntaPK;

public class Pregunta {

	private PreguntaPK pk;
	private String descripcion;
	private List<CursoPregunta> cursopregunta;
	private List<ExamenPregunta> examenpregunta;

	public Pregunta() {
		pk = new PreguntaPK();
	}

	public PreguntaPK getPk() {
		return pk;
	}

	public void setPk(PreguntaPK pk) {
		this.pk = pk;
	}

	public String getDescripcion() {
		return descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	public List<CursoPregunta> getCursopregunta() {
		return cursopregunta;
	}

	public void setCursopregunta(List<CursoPregunta> cursopregunta) {
		this.cursopregunta = cursopregunta;
	}

	public List<ExamenPregunta> getExamenpregunta() {
		return examenpregunta;
	}

	public void setExamenpregunta(List<ExamenPregunta> examenpregunta) {
		this.examenpregunta = examenpregunta;
	}

}
