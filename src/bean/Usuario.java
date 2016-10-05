package bean;

import bean.pk.UsuarioPK;

public class Usuario {

	private UsuarioPK pk;
	private String nombres;
	private String apellidopaterno;
	private String apellidomaterno;
	private String usuario;
	private String clave;
	private Rol rol;

	public Usuario() {
		pk = new UsuarioPK();
		rol = new Rol();
	}

	public UsuarioPK getPk() {
		return pk;
	}

	public void setPk(UsuarioPK pk) {
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

	public String getUsuario() {
		return usuario;
	}

	public void setUsuario(String usuario) {
		this.usuario = usuario;
	}

	public String getClave() {
		return clave;
	}

	public void setClave(String clave) {
		this.clave = clave;
	}

	public Rol getRol() {
		return rol;
	}

	public void setRol(Rol rol) {
		this.rol = rol;
	}

}