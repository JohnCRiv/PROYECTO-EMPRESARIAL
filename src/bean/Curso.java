package bean;

import java.util.List;

import bean.pk.CursoPK;

public class Curso {

	private CursoPK pk;
	private String descripcion;
	private Integer creditos;
	private Integer horasteoria;
	private Integer horaslaboratorio;
	private Integer horastotal;
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
	
	public Integer getCreditos() {
		return creditos;
	}

	public void setCreditos(Integer creditos) {
		this.creditos = creditos;
	}

	public Integer getHorasteoria() {
		return horasteoria;
	}

	public void setHorasteoria(Integer horasteoria) {
		this.horasteoria = horasteoria;
	}

	public Integer getHoraslaboratorio() {
		return horaslaboratorio;
	}

	public void setHoraslaboratorio(Integer horaslaboratorio) {
		this.horaslaboratorio = horaslaboratorio;
	}

	public Integer getHorastotal() {
		return horastotal;
	}

	public void setHorastotal(Integer horastotal) {
		this.horastotal = horastotal;
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
