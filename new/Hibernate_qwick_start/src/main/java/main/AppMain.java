package main;

import dao.Contact;
//import org.hibernate.Session;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import utils.HibernateSessionFactory;

import java.time.LocalDate;
import java.util.Date;
import java.util.List;


public class AppMain {

    public static void main(String[] args) {
        System.out.println("Hibernate tutorial");

        try(SessionFactory sessionFactory = HibernateSessionFactory.buildSessionFactory();
            Session session = sessionFactory.openSession()){

            Transaction tx = session.beginTransaction();

//            Contact contactEntity = new Contact();
//
//        contactEntity.setBirthDate(new Date());
//        contactEntity.setFirstName("Nick5");
//        contactEntity.setLastName("VN5");
//
//        session.save(contactEntity);





//            Query query = session.createQuery("from Contact where firstName = :paramName");
//            query.setParameter("paramName", "Nick");
//            List list = query.list();
//            System.out.println(list);
//            session.getTransaction().commit();



//            Query query = session.createQuery("update Contact set firstName = :nameParam, lastName = :lastNameParam" +
//                    ", birthDate = :birthDateParam"+
//                    " where firstName = :nameCode");
//
//            query.setParameter("nameCode", "Nick");
//            query.setParameter("nameParam", "NickChangedName1");
//            query.setParameter("lastNameParam", "LastNameChanged1" );
//            query.setParameter("birthDateParam", new Date());
//
//            int result = query.executeUpdate();


            Query query =  session.createQuery("delete Contact where firstName = :param");
            query.setParameter("param", "Leonid");
            int result = query.executeUpdate();



            String sqlDeleteString = "delete Contact where firstName = :param";
            int result2 = session.createQuery(sqlDeleteString)
                    .setString("param", "Leonid")
                    .executeUpdate();

            tx.commit();
//            session.close();







        }

//        Session session = HibernateSessionFactory.getSessionFactory().openSession();
//
//        session.beginTransaction();
//
//        Contact contactEntity = new Contact();
//
//        contactEntity.setBirthDate(new Date());
//        contactEntity.setFirstName("Nick");
//        contactEntity.setLastName("VN");
//
//        session.save(contactEntity);
//        session.getTransaction().commit();
//
//        session.getSessionFactory().close();


    }
}
