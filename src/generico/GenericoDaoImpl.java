package generico;

import static util.Validador.esNulo;

import java.lang.reflect.ParameterizedType;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.TypedQuery;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;

import org.springframework.transaction.annotation.Transactional;

import util.Constantes;
import util.Parametro;

public abstract class GenericoDaoImpl<T> implements GenericoDao<T> {
	
	private EntityManagerFactory entityManagerFactory;
	private EntityManager entityManager;
	private Class<T> clazz;
	
	@SuppressWarnings("unchecked")
	protected GenericoDaoImpl() {
		clazz = (Class<T>) ((ParameterizedType) getClass()
				.getGenericSuperclass()).getActualTypeArguments()[0];
	}
	
	@Override
	@Transactional
	public void registrar(T bean) {
		openConnection();
		entityManager.getTransaction().begin();
		entityManager.persist(bean);
		entityManager.getTransaction().commit();
		closeConnection();
	}
	
	@Override
	public void actualizar(T bean) {
		openConnection();
		entityManager.getTransaction().begin();
		entityManager.merge(bean);
		entityManager.getTransaction().commit();
		closeConnection();
	}
	
	@Override
	public T buscar(Object pk) {
		openConnection();
		T bean = entityManager.find(clazz, pk);
		closeConnection();
		return bean;
	}
	
	@Override
	public void eliminar(T bean) {
		openConnection();
		entityManager.getTransaction().begin();
		entityManager.remove(entityManager.merge(bean));
		entityManager.getTransaction().commit();
		closeConnection();
	}
	
	@Override
	public List<T> listarTodos() {
		openConnection();
		CriteriaBuilder criteria = entityManager.getCriteriaBuilder();
		CriteriaQuery<T> query = criteria.createQuery(clazz);
		TypedQuery<T> list = entityManager.createQuery(query);
		return list.getResultList();
	}
	
	@Override
	public List<T> listarPorQuery(String query) {
		openConnection();
		TypedQuery<T> typedQuery = entityManager.createQuery(query, clazz);
		return typedQuery.getResultList();
	}
	
	@Override
	public List<T> listarPorWhereQuery(String whereQuery) {
		return this.listarPorWhereQuery(whereQuery, null);
	}
	
	@Override
	public List<T> listarPorWhereQuery(String whereQuery, List<Parametro> parametros) {
		openConnection();
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
		openConnection();
		CriteriaBuilder criteriaBuilder = entityManager.getCriteriaBuilder();
		closeConnection();
		return criteriaBuilder;
	}
	
	private void openConnection() {
		entityManagerFactory = Persistence.createEntityManagerFactory(Constantes.PERSISTENCE_UNIT);
		entityManager = entityManagerFactory.createEntityManager();
	}
	
	private void closeConnection() {
		if (!esNulo(entityManager))
			entityManager.close();
		if (!esNulo(entityManagerFactory))
			entityManagerFactory.close();
	}
	
}
