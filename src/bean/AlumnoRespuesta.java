package bean;

import bean.pk.AlumnoRespuestaPK;

public class AlumnoRespuesta {

	private AlumnoRespuestaPK pk;
	private String texto;

	// Auxiliaries
	private Alumno alumno;
	private Curso curso;
	private Examen examen;
	private Pregunta pregunta;

	public AlumnoRespuesta() {
		pk = new AlumnoRespuestaPK();
	}

	public AlumnoRespuestaPK getPk() {
		return pk;
	}

	public void setPk(AlumnoRespuestaPK pk) {
		this.pk = pk;
	}

	public String getTexto() {
		return texto;
	}

	public void setTexto(String texto) {
		this.texto = texto;
	}

	public Alumno getAlumno() {
		return alumno;
	}

	public void setAlumno(Alumno alumno) {
		this.alumno = alumno;
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
