package bean;

import java.util.Date;
import java.util.List;

import bean.pk.AlumnoPK;

public class Alumno {

	private AlumnoPK pk;
	private String nombres;
	private String apellidopaterno;
	private String apellidomaterno;
	private String numerodocumento;
	private Date fechanacimiento;
	private List<AlumnoCurso> alumnocurso;

	public Alumno() {
		pk = new AlumnoPK();
	}

	public AlumnoPK getPk() {
		return pk;
	}

	public void setPk(AlumnoPK pk) {
		this.pk = pk;
	}

	public String getNombres() {
		return nombres;
	}

	public void setNombres(String nombres) {
		this.nombres = nombres;
	}

	public String getApellidopaterno() {
		return apellidopaterno;
	}

	public void setApellidopaterno(String apellidopaterno) {
		this.apellidopaterno = apellidopaterno;
	}

	public String getApellidomaterno() {
		return apellidomaterno;
	}

	public void setApellidomaterno(String apellidomaterno) {
		this.apellidomaterno = apellidomaterno;
	}

	public String getNumerodocumento() {
		return numerodocumento;
	}

	public void setNumerodocumento(String numerodocumento) {
		this.numerodocumento = numerodocumento;
	}

	public Date getFechanacimiento() {
		return fechanacimiento;
	}

	public void setFechanacimiento(Date fechanacimiento) {
		this.fechanacimiento = fechanacimiento;
	}

	public List<AlumnoCurso> getAlumnocurso() {
		return alumnocurso;
	}

	public void setAlumnocurso(List<AlumnoCurso> alumnocurso) {
		this.alumnocurso = alumnocurso;
	}

}
