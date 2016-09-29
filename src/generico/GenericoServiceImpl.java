package generico;

import java.util.List;

import util.Parametro;

public class GenericoServiceImpl<T> implements GenericoService<T> {
	
	protected GenericoDao<T> genericoDao;
	
	protected GenericoServiceImpl() {}
	
	@Override
	public void registrar(T bean) {
		genericoDao.registrar(bean);
	}
	
	@Override
	public void actualizar(T bean) {
		genericoDao.actualizar(bean);
	}
	
	@Override
	public T buscar(Object pk) {
		return genericoDao.buscar(pk);
	}
	
	@Override
	public void eliminar(T bean) {
		genericoDao.eliminar(bean);
	}
	
	@Override
	public List<T> listarTodos() {
		return genericoDao.listarTodos();
	}
	
	@Override
	public List<T> listarPorQuery(String query) {
		return genericoDao.listarPorQuery(query);
	}
	
	@Override
	public List<T> listarPorWhereQuery(String whereQuery) {
		return genericoDao.listarPorWhereQuery(whereQuery);
	}
	
	@Override
	public List<T> listarPorWhereQuery(String nombreQuery, List<Parametro> parametros) {
		return genericoDao.listarPorWhereQuery(nombreQuery, parametros);
	}
	
	protected void setGenericoDao(GenericoDao<T> genericoDao) {
		this.genericoDao = genericoDao;
	}
	
}
