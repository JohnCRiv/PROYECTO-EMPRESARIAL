package bean;

import bean.pk.ExamenPreguntaPK;

public class ExamenPregunta {

	private ExamenPreguntaPK pk;

	// Auxiliaries
	private Curso curso;
	private Examen examen;
	private Pregunta pregunta;

	public ExamenPregunta() {
		pk = new ExamenPreguntaPK();
	}

	public ExamenPreguntaPK getPk() {
		return pk;
	}

	public void setPk(ExamenPreguntaPK pk) {
		this.pk = pk;
	}

	public Curso getCurso() {
		return curso;
	}

	public void setCurso(Curso curso) {
		this.curso = curso;
	}

	public Examen getExamen() {
		return examen;
	}

	public void setExamen(Examen examen) {
		this.examen = examen;
	}

	public Pregunta getPregunta() {
		return pregunta;
	}

	public void setPregunta(Pregunta pregunta) {
		this.pregunta = pregunta;
	}

}