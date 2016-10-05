package bean;

import java.util.Date;

import bean.pk.AlumnoExamenPK;

public class AlumnoExamen {

	private AlumnoExamenPK pk;
	private Date fecha;

	// Auxiliaries
	private Alumno alumno;
	private Curso curso;
	private Examen examen;

	public AlumnoExamen() {
		pk = new AlumnoExamenPK();
	}

	public AlumnoExamenPK getPk() {
		return pk;
	}

	public void setPk(AlumnoExamenPK pk) {
		this.pk = pk;
	}

	public Date getFecha() {
		return fecha;
	}

	public void setFecha(Date fecha) {
		this.fecha = fecha;
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

}
