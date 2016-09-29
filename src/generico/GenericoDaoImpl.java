package generico;

import java.lang.reflect.ParameterizedType;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.TypedQuery;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;

import util.Constantes;
import util.Parametro;

public class GenericoDaoImpl<T> implements GenericoDao<T> {
	
	private EntityManagerFactory entityManagerFactory;
	private EntityManager entityManager;
	private Class<T> clazz;
	
	@SuppressWarnings("unchecked")
	protected GenericoDaoImpl() {
		entityManagerFactory = Persistence.createEntityManagerFactory(Constantes.PERSISTENCE_UNIT);
		entityManager = entityManagerFactory.createEntityManager();
		clazz = (Class<T>) ((ParameterizedType) getClass()
				.getGenericSuperclass()).getActualTypeArguments()[0];
	}
	
	@Override
	public void registrar(T bean) {
		entityManager.getTransaction().begin();
		entityManager.persist(bean);
		entityManager.getTransaction().commit();
	}
	
	@Override
	public void actualizar(T bean) {
		entityManager.getTransaction().begin();
		entityManager.merge(bean);
		entityManager.getTransaction().commit();
	}
	
	@Override
	public T buscar(Object pk) {
		return entityManager.find(clazz, pk);
	}
	
	@Override
	public void eliminar(T bean) {
		entityManager.getTransaction().begin();
		entityManager.remove(bean);
		entityManager.getTransaction().commit();
	}
	
	@Override
	public List<T> listarTodos() {
		CriteriaBuilder criteria = entityManager.getCriteriaBuilder();
		CriteriaQuery<T> query = criteria.createQuery(clazz);
		TypedQuery<T> list = entityManager.createQuery(query);
		return list.getResultList();
	}
	
	@Override
	public List<T> listarPorQuery(String query) {
		TypedQuery<T> typedQuery = entityManager.createQuery(query, clazz);
		return typedQuery.getResultList();
	}
	
	@Override
	public List<T> listarPorWhereQuery(String whereQuery) {
		return this.listarPorWhereQuery(whereQuery, null);
	}
	
	@Override
	public List<T> listarPorWhereQuery(String whereQuery, List<Parametro> parametros) {
		String prefixQuery = "SELECT entity FROM " + clazz.getSimpleName() + " entity where ";
		TypedQuery<T> query = entityManager.createQuery(prefixQuery + whereQuery, clazz);
		if (parametros != null) {
			for (Parametro parametro : parametros) {
				query.setParameter(parametro.getNombreParametro(), parametro.getValorParametro());
			}
		}
		return query.getResultList();
	}
	
	@Override
	public CriteriaBuilder getCriteriaBuilder() {
		return entityManager.getCriteriaBuilder();
	}
	
}
