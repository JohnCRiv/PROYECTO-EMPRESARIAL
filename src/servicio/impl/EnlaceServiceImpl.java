package servicio.impl;

import java.util.List;

import bean.Enlace;
import bean.Rol;
import dao.EnlaceDao;
import factory.Factory;
import generico.GenericoServiceImpl;
import servicio.EnlaceService;
import util.Constantes;

public class EnlaceServiceImpl extends GenericoServiceImpl<Enlace> implements EnlaceService {
	
	private Factory factory = Factory.getFactory(Constantes.ORIGEN_DATOS);
	private EnlaceDao dao = factory.getEnlaceDAO();
	private static EnlaceServiceImpl service;
	
	private EnlaceServiceImpl() {
		super.setGenericoDao(dao);
	}
	
	public static EnlaceServiceImpl getInstance() {
		if(service == null) 
			service = new EnlaceServiceImpl();
		
		return service;
	}

	@Override
	public List<Enlace> obtenerEnlacesPorRol(Rol rol) {
		return dao.obtenerEnlacesPorRol(rol);
	}
	
}
