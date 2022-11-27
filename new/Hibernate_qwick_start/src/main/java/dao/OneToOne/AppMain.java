package dao.OneToOne;

import org.hibernate.Session;
import org.hibernate.Transaction;
import utils.HibernateSessionFactory;


import javax.persistence.EntityManager;
import javax.persistence.PersistenceUnit;
import java.util.List;

public class AppMain {

    @PersistenceUnit
    static EntityManager emf;

    public static void main(String[] args) {
        System.out.println("Hibernate tutorial start");

        Session session = HibernateSessionFactory.buildSessionFactory().openSession();
        EmployeeDAOImpl employeeDAO = new EmployeeDAOImpl();
        employeeDAO.setSession(session);

        Address address = new Address();
        address.setCity("Moscow4");
        address.setStreet("Lenina4");

        Employee employee = new Employee();
        employee.setFirstName("FirstName4");
        employee.setLastName("LasettName4");

        employee.setAddress(address);
        address.setEmployee(employee);



        Transaction tx = session.beginTransaction();

        session.save(address);
        session.save(employee);

//        List<Employee> employeeList = employeeDAO.findAll();
//        for (Employee empl : employeeList) {
//            System.out.println("Found entity: " + empl);
//            System.out.println("Address from employee entity: " + empl.getAddress().getId());
//            System.out.println("Address from database before transaction complete: " +
//                    employeeDAO.findAddressById(empl.getAddress().getId()) );
//        }
        tx.commit();
        session.getSessionFactory().close();
    }

}