package bean;

import java.util.List;

import bean.pk.EnlacePK;

public class Enlace {
	
	private EnlacePK pk;
	private String descripcion;
	private String ruta;
	private String icono;
	private List<RolEnlace> rolenlace;
	
	//
	private Boolean seleccionado;
	
	public Enlace() {
		pk = new EnlacePK();
	}

	public EnlacePK getPk() {
		return pk;
	}

	public void setPk(EnlacePK pk) {
		this.pk = pk;
	}

	public String getDescripcion() {
		return descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	public String getRuta() {
		return ruta;
	}

	public void setRuta(String ruta) {
		this.ruta = ruta;
	}

	public String getIcono() {
		return icono;
	}

	public void setIcono(String icono) {
		this.icono = icono;
	}

	public List<RolEnlace> getRolenlace() {
		return rolenlace;
	}

	public void setRolenlace(List<RolEnlace> rolenlace) {
		this.rolenlace = rolenlace;
	}

	public Boolean getSeleccionado() {
		return seleccionado;
	}

	public void setSeleccionado(Boolean seleccionado) {
		this.seleccionado = seleccionado;
	}
	
	public Boolean esSeleccionado() {
		return seleccionado;
	}
	
}