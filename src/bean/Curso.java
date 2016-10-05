package bean;

import java.util.List;

import bean.pk.CursoPK;

public class Curso {

	private CursoPK pk;
	private String descripcion;
	private List<AlumnoCurso> alumnocurso;
	private List<CursoExamen> cursoexamen;
	private List<CursoPregunta> cursopregunta;

	public Curso() {
		pk = new CursoPK();
	}

	public CursoPK getPk() {
		return pk;
	}

	public void setPk(CursoPK pk) {
		this.pk = pk;
	}

	public String getDescripcion() {
		return descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	public List<AlumnoCurso> getAlumnocurso() {
		return alumnocurso;
	}

	public void setAlumnocurso(List<AlumnoCurso> alumnocurso) {
		this.alumnocurso = alumnocurso;
	}

	public List<CursoExamen> getCursoexamen() {
		return cursoexamen;
	}

	public void setCursoexamen(List<CursoExamen> cursoexamen) {
		this.cursoexamen = cursoexamen;
	}

	public List<CursoPregunta> getCursopregunta() {
		return cursopregunta;
	}

	public void setCursopregunta(List<CursoPregunta> cursopregunta) {
		this.cursopregunta = cursopregunta;
	}

}
