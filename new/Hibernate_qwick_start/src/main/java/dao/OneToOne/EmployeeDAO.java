package dao.OneToOne;

import java.util.List;

public interface EmployeeDAO {

    List<Employee> findAll();
    Address findAddressById(int id);
}
