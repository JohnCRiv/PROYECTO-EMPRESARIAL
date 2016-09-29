package bean;

import java.util.List;

public class Rol {
	
	private RolPK pk;
	private String rol;
	private List<Usuario> usuarios;
	private List<RolEnlace> rolenlace;
	
	public Rol() {
		pk = new RolPK();
	}
	
	public RolPK getPk() {
		return pk;
	}
	
	public void setPk(RolPK pk) {
		this.pk = pk;
	}
	
	public String getRol() {
		return rol;
	}
	
	public void setRol(String rol) {
		this.rol = rol;
	}

	public List<Usuario> getUsuarios() {
		return usuarios;
	}

	public void setUsuarios(List<Usuario> usuarios) {
		this.usuarios = usuarios;
	}

	public List<RolEnlace> getRolenlace() {
		return rolenlace;
	}

	public void setRolenlace(List<RolEnlace> rolenlace) {
		this.rolenlace = rolenlace;
	}
	
}
