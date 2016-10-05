package bean;

import bean.pk.CursoPreguntaPK;

public class CursoPregunta {

	private CursoPreguntaPK pk;

	// Auxiliaries
	private Curso curso;
	private Pregunta pregunta;

	public CursoPregunta() {
		pk = new CursoPreguntaPK();
	}

	public CursoPreguntaPK getPk() {
		return pk;
	}

	public void setPk(CursoPreguntaPK pk) {
		this.pk = pk;
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
