package util;

public class MensajeUsuario  {
	
	private TipoMensaje tipoMensaje;
	private String titulo;
	private String mensaje;
	
	public enum TipoMensaje {
		ERROR, ADVERTENCIA, EXITO, INFORMACION
	}
	
	public MensajeUsuario() {}
	
	public MensajeUsuario(TipoMensaje tipoMensaje, String mensaje) {
		this.tipoMensaje = tipoMensaje;
		this.mensaje = mensaje;
		this.titulo = "";
	}
	
	public MensajeUsuario(TipoMensaje tipoMensaje, String titulo, String mensaje) {
		this.tipoMensaje = tipoMensaje;
		this.titulo = titulo;
		this.mensaje = mensaje;
	}
	
	public String getTitulo() {
		return titulo;
	}
	
	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}
	
	public String getMensaje() {
		return mensaje;
	}
	
	public void setMensaje(String mensaje) {
		this.mensaje = mensaje;
	}
	
	public TipoMensaje getTipoMensaje() {
		return tipoMensaje;
	}
	
	public void setTipoMensaje(TipoMensaje tipoMensaje) {
		this.tipoMensaje = tipoMensaje;
	}

}
