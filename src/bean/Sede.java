package bean;

import java.util.Date;

import bean.pk.SedePK;

public class Sede {

	private SedePK pk;
	private String nombre;
	private String direccion;
	private String telefono;
	private String representante;
	private Date fechainaguracion;

	public Sede() {
		pk = new SedePK();
	}

	public SedePK getPk() {
		return pk;
	}

	public void setPk(SedePK pk) {
		this.pk = pk;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getDireccion() {
		return direccion;
	}

	public void setDireccion(String direccion) {
		this.direccion = direccion;
	}

	public String getTelefono() {
		return telefono;
	}

	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}

	public String getRepresentante() {
		return representante;
	}

	public void setRepresentante(String representante) {
		this.representante = representante;
	}

	public Date getFechainaguracion() {
		return fechainaguracion;
	}

	public void setFechainaguracion(Date fechainaguracion) {
		this.fechainaguracion = fechainaguracion;
	}

}
