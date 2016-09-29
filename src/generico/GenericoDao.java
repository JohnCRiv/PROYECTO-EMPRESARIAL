package generico;

import java.util.List;

import javax.persistence.criteria.CriteriaBuilder;

import util.Parametro;

public interface GenericoDao<T> {
	
	public void registrar(T bean);
	
	public void actualizar(T bean);
	
	public T buscar(Object pk);
	
	public void eliminar(T bean);
	
	public List<T> listarTodos();
	
	public List<T> listarPorQuery(String query);
	
	public List<T> listarPorWhereQuery(String whereQuery);
	
	public List<T> listarPorWhereQuery(String whereQuery, List<Parametro> parametros);
	
	public CriteriaBuilder getCriteriaBuilder();
	
}
