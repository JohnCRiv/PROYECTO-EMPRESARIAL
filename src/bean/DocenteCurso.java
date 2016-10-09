package bean;

import bean.pk.DocenteCursoPK;

public class DocenteCurso {

	private DocenteCursoPK pk;

	// Auxiliaries
	private Docente docente;
	private Curso curso;

	public DocenteCurso() {
		pk = new DocenteCursoPK();
	}

	public DocenteCursoPK getPk() {
		return pk;
	}

	public void setPk(DocenteCursoPK pk) {
		this.pk = pk;
	}

	public Docente getDocente() {
		return docente;
	}

	public void setDocente(Docente docente) {
		this.docente = docente;
	}

	public Curso getCurso() {
		return curso;
	}

	public void setCurso(Curso curso) {
		this.curso = curso;
	}

}
