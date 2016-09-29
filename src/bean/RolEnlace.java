package bean;

public class RolEnlace {

	private RolEnlacePK pk;
	private String campo;
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

	public String getCampo() {
		return campo;
	}

	public void setCampo(String campo) {
		this.campo = campo;
	}
	
}
