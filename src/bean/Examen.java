package bean;

import java.util.Date;
import java.util.List;

import bean.pk.ExamenPK;

public class Examen {

	private ExamenPK pk;
	private String descripcion;
	private Integer duracion;
	private Date fechainicio;
	private Date fechafin;
	private List<CursoExamen> cursoexamen;
	private List<AlumnoExamen> alumnoexamen;

	public Examen() {
		pk = new ExamenPK();
	}

	public ExamenPK getPk() {
		return pk;
	}

	public void setPk(ExamenPK pk) {
		this.pk = pk;
	}

	public String getDescripcion() {
		return descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	public Integer getDuracion() {
		return duracion;
	}

	public void setDuracion(Integer duracion) {
		this.duracion = duracion;
	}

	public Date getFechainicio() {
		return fechainicio;
	}

	public void setFechainicio(Date fechainicio) {
		this.fechainicio = fechainicio;
	}

	public Date getFechafin() {
		return fechafin;
	}

	public void setFechafin(Date fechafin) {
		this.fechafin = fechafin;
	}

	public List<CursoExamen> getCursoexamen() {
		return cursoexamen;
	}

	public void setCursoexamen(List<CursoExamen> cursoexamen) {
		this.cursoexamen = cursoexamen;
	}

	public List<AlumnoExamen> getAlumnoexamen() {
		return alumnoexamen;
	}

	public void setAlumnoexamen(List<AlumnoExamen> alumnoexamen) {
		this.alumnoexamen = alumnoexamen;
	}

}
