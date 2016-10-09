package bean;

import java.util.Date;

import bean.pk.DocentePK;

public class Docente {

	private DocentePK pk;
	private String nombres;
	private String apellidopaterno;
	private String apellidomaterno;
	private String numerodocumento;
	private Date fechanacimiento;
	private Sede sede;

	public Docente() {
		pk = new DocentePK();
		sede = new Sede();
	}

	public DocentePK getPk() {
		return pk;
	}

	public void setPk(DocentePK pk) {
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

	public Sede getSede() {
		return sede;
	}

	public void setSede(Sede sede) {
		this.sede = sede;
	}

}
