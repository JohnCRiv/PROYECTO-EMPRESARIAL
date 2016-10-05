package bean;

import bean.pk.CursoExamenPK;

public class CursoExamen {

	private CursoExamenPK pk;

	// Auxiliaries
	private Curso curso;
	private Examen Examen;

	public CursoExamen() {
		pk = new CursoExamenPK();
	}

	public CursoExamenPK getPk() {
		return pk;
	}

	public void setPk(CursoExamenPK pk) {
		this.pk = pk;
	}

	public Curso getCurso() {
		return curso;
	}

	public void setCurso(Curso curso) {
		this.curso = curso;
	}

	public Examen getExamen() {
		return Examen;
	}

	public void setExamen(Examen examen) {
		Examen = examen;
	}

}
