package Data;

import Model.Review;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import java.util.List;

public class reviewIO {
    public static final EntityManagerFactory emf = Persistence.createEntityManagerFactory("dhs");


    public void insert (Review review)
    {EntityManager em = emf.createEntityManager();
        EntityTransaction transaction = em.getTransaction();
        try {
            transaction.begin();
            em.persist(review);
            transaction.commit();
        } finally {
            if (transaction.isActive()){
                transaction.rollback();
            }
            em.close();
            emf.close();
        }
    }

    public void update (Review review)
    {EntityManager em = emf.createEntityManager();
        EntityTransaction transaction = em.getTransaction();
        try {
            transaction.begin();

            em.merge(review);
            transaction.commit();
        } finally {
            if (transaction.isActive()){
                transaction.rollback();
            }
            em.close();
            emf.close();
        }
    }
    public void delete (Review review)
    {EntityManager em = emf.createEntityManager();
        EntityTransaction transaction = em.getTransaction();
        try {
            transaction.begin();
                em.remove(review);

            transaction.commit();
        } finally {
            if (transaction.isActive()){
                transaction.rollback();
            }
            em.close();
            emf.close();
        }
    }
    public static List selectOrderReviewList(long ID)
    {
        EntityManager em = emf.createEntityManager();
        try {
            List acc = em.createQuery("SELECT p.productByProductId.id as MaDonHang, " +
                    "p.title as TieuDe, g.title as TenSanPham" +
                    ",p.content as NhanXet FROM Review p ," +
                    " Account  n , Product g ,Shop s WHERE p.accountByAccountId.id = n.id AND " +
                    "p.productByProductId.id = g.id AND g.shopByShopId.id=s.id AND " +
                    " s.accountByAccountId.id = n.id  AND  n.id =?1").setParameter(1,ID).getResultList();
            return acc;

        } catch (Exception e)
        {
            System.out.println(e);
            return null;
        }finally {
            em.close();
        }
    }
}
