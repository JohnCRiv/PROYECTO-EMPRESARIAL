package bean;

import bean.pk.RolEnlacePK;

public class RolEnlace {

	private RolEnlacePK pk;
	
	// Auxiliaries
	private Rol rol;
	private Enlace enlace;
	
	public RolEnlace() {
		pk = new RolEnlacePK();
	}

	public RolEnlacePK getPk() {
		return pk;
	}

	public void setPk(RolEnlacePK pk) {
		this.pk = pk;
	}

	public Rol getRol() {
		return rol;
	}

	public void setRol(Rol rol) {
		this.rol = rol;
	}

	public Enlace getEnlace() {
		return enlace;
	}

	public void setEnlace(Enlace enlace) {
		this.enlace = enlace;
	}
	
}