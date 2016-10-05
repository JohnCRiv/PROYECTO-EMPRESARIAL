package bean;

import bean.pk.PreguntaOpcionPK;

public class PreguntaOpcion {

	private PreguntaOpcionPK pk;
	private String descripcion;
	private String estexto;
	private String esrespuesta;

	// Auxiliaries
	private Curso curso;
	private Pregunta pregunta;
	
	public PreguntaOpcion() {
		pk = new PreguntaOpcionPK();
	}

	public PreguntaOpcionPK getPk() {
		return pk;
	}

	public void setPk(PreguntaOpcionPK pk) {
		this.pk = pk;
	}

	public String getDescripcion() {
		return descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	public String getEstexto() {
		return estexto;
	}

	public void setEstexto(String estexto) {
		this.estexto = estexto;
	}

	public String getEsrespuesta() {
		return esrespuesta;
	}

	public void setEsrespuesta(String esrespuesta) {
		this.esrespuesta = esrespuesta;
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
