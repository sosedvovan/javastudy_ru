package utils;

import org.hibernate.SessionFactory;
import org.hibernate.boot.MetadataSources;
import org.hibernate.boot.registry.StandardServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;

import java.io.File;

public class HibernateSessionFactory {

//    private static SessionFactory sessionFactory = buildSessionFactory();

    public static SessionFactory buildSessionFactory() {

        File configfile = new File("src"+File.separator+"main"+File.separator+"resources"+File.separator+"hibernate.cfg.xml");

        //получаем объект с конфигурацией
        Configuration configuration = new Configuration();

        //показываем где лежит файл с конфигурацией
        //если не показать, то будет искать в папке с ресурсами
        configuration.configure();
//        configuration.configure();

        return configuration.buildSessionFactory();




//        // A SessionFactory is set up once for an application!
//        final StandardServiceRegistry registry = new StandardServiceRegistryBuilder()
//                .configure(configfile) // configures settings from hibernate.cfg.xml
//                .build();
//        try {
//            sessionFactory = new MetadataSources( registry ).buildMetadata().buildSessionFactory();
//        }
//        catch (Exception e) {
//            // The registry would be destroyed by the SessionFactory,
//            // but we had trouble building the SessionFactory
//            // so destroy it manually.
//            StandardServiceRegistryBuilder.destroy( registry );
//
//            throw new ExceptionInInitializerError("Initial SessionFactory failed" + e);
//        }
//
//         return sessionFactory;


    }


//    public static SessionFactory getSessionFactory() {
//        return sessionFactory;
//    }

//    public static void shutdown() {
//        // Close caches and connection pools
//        getSessionFactory().close();
//    }

}
