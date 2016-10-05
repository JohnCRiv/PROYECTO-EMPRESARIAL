package bean;

import bean.pk.AlumnoCursoPK;

public class AlumnoCurso {

	private AlumnoCursoPK pk;
	
	// Auxiliaries
	private Alumno alumno;
	private Curso curso;

	public AlumnoCurso() {
		pk = new AlumnoCursoPK();
	}

	public AlumnoCursoPK getPk() {
		return pk;
	}

	public void setPk(AlumnoCursoPK pk) {
		this.pk = pk;
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

}
