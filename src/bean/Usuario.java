package bean;

public class Usuario {
	
	private UsuarioPK pk;
	private String nombres;
	private String apellidoPaterno;
	private TipoDocumento tipodocumento;
	private Rol rol;
	
	public Usuario() {
		pk = new UsuarioPK();
		tipodocumento = new TipoDocumento();
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
	
	public String getApellidoPaterno() {
		return apellidoPaterno;
	}
	
	public void setApellidoPaterno(String apellidoPaterno) {
		this.apellidoPaterno = apellidoPaterno;
	}
	
	public TipoDocumento getTipodocumento() {
		return tipodocumento;
	}
	
	public void setTipodocumento(TipoDocumento tipodocumento) {
		this.tipodocumento = tipodocumento;
	}
	
	public Rol getRol() {
		return rol;
	}
	
	public void setRol(Rol rol) {
		this.rol = rol;
	}
	
}
