package bean;

import java.util.List;

public class TipoDocumento {
	
	private TipoDocumentoPK pk;
	private String documento;
	private List<Usuario> usuarios;
	
	public TipoDocumento() {
		pk = new TipoDocumentoPK();
	}

	public TipoDocumentoPK getPk() {
		return pk;
	}

	public void setPk(TipoDocumentoPK pk) {
		this.pk = pk;
	}

	public String getDocumento() {
		return documento;
	}

	public void setDocumento(String documento) {
		this.documento = documento;
	}

	public List<Usuario> getUsuarios() {
		return usuarios;
	}

	public void setUsuarios(List<Usuario> usuarios) {
		this.usuarios = usuarios;
	}

}
