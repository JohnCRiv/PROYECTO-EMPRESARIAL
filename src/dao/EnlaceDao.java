package dao;

import java.util.List;

import bean.Enlace;
import bean.Rol;
import generico.GenericoDao;

public interface EnlaceDao extends GenericoDao<Enlace> {
	
	public List<Enlace> obtenerEnlacesPorRol(Rol rol);
	
}
