package dao.OneToOne;

import org.hibernate.Query;
import org.hibernate.Session;
import java.util.List;

public class EmployeeDAOImpl implements EmployeeDAO {

    private Session session;

    public List<Employee> findAll() {
        return session.createQuery("from Employee c").list();
    }

    public Address findAddressById(int id) {
        Query query = session.createQuery("from Address a where a.id = :id");
        query.setParameter("id", id);
        return (Address) query.uniqueResult() ;
    }

    public void setSession(Session session) {
        this.session = session;
    }
}
