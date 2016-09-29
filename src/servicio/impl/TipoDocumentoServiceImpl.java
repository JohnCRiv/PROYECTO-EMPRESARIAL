package servicio.impl;

import bean.TipoDocumento;
import dao.TipoDocumentoDao;
import factory.Factory;
import generico.GenericoServiceImpl;
import servicio.TipoDocumentoService;
import util.Constantes;

public class TipoDocumentoServiceImpl extends GenericoServiceImpl<TipoDocumento> implements TipoDocumentoService {
	
	private Factory factory = Factory.getFactory(Constantes.ORIGEN_DATOS);
	private TipoDocumentoDao dao = factory.getTipoDocumentoDAO();
	private static TipoDocumentoServiceImpl service;
	
	private TipoDocumentoServiceImpl() {
		super.setGenericoDao(dao);
	}
	
	public static TipoDocumentoServiceImpl getInstance() {
		if(service == null) 
			service = new TipoDocumentoServiceImpl();
		
		return service;
	}
	
}
