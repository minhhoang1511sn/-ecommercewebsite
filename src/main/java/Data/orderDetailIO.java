package Data;

import Model.OrderDetail;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;

public class orderDetailIO {
    EntityManagerFactory emf = Persistence.createEntityManagerFactory("default");
    EntityManager em = emf.createEntityManager();
    EntityTransaction transaction = em.getTransaction();

    public void insert (OrderDetail orderDetail)
    {
        try {
            transaction.begin();

            transaction.commit();
        } finally {
            if (transaction.isActive()){
                transaction.rollback();
            }
            em.close();
            emf.close();
        }
    }

    public void update (OrderDetail orderDetail)
    {
        try {
            transaction.begin();


            transaction.commit();
        } finally {
            if (transaction.isActive()){
                transaction.rollback();
            }
            em.close();
            emf.close();
        }
    }
    public void delete (OrderDetail orderDetail)
    {
        try {
            transaction.begin();


            transaction.commit();
        } finally {
            if (transaction.isActive()){
                transaction.rollback();
            }
            em.close();
            emf.close();
        }
    }
}
