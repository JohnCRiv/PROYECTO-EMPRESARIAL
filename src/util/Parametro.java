package util;

public class Parametro {
	
	private String nombreParametro;
	private Object valorParametro;
	private TipoParametro tipoParametro;
	
	public enum TipoParametro {
		EQUALS, LIKE, LIKE_INICIAL, IN
	}
	
	public Parametro(String nombreParametro, Object valorParametro) {
		this.nombreParametro = nombreParametro;
		this.valorParametro = valorParametro;
		this.tipoParametro = TipoParametro.EQUALS;
	}
	
	public Parametro(String nombreParametro, Object valorParametro, TipoParametro tipoParametro) {
		this.nombreParametro = nombreParametro;
		this.valorParametro = valorParametro;
		this.tipoParametro = tipoParametro;
	}

	public String getNombreParametro() {
		return nombreParametro;
	}

	public void setNombreParametro(String nombreParametro) {
		this.nombreParametro = nombreParametro;
	}

	public Object getValorParametro() {
		
		switch (tipoParametro) {
			case EQUALS:
				return valorParametro;
			case LIKE:
				return "%" + valorParametro + "%";
			case LIKE_INICIAL:
				return valorParametro + "%";
			case IN:
				String[] stringValues = (String[]) valorParametro;
				StringBuilder in = new StringBuilder();
				for (int i = 0; i < stringValues.length; i++) {
					if ( (i + 1) == stringValues.length) 
						in.append(stringValues[i]);
					else 
						in.append(stringValues[i] + ",");
				}
				return in.toString();
			default:
				return null;
		}
		
	}

	public void setValorParametro(Object valorParametro) {
		this.valorParametro = valorParametro;
	}

	public TipoParametro getTipoParametro() {
		return tipoParametro;
	}

	public void setTipoParametro(TipoParametro tipoParametro) {
		this.tipoParametro = tipoParametro;
	}
	
}
