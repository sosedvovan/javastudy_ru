package dao.OneToOne;

import javax.persistence.*;

@Entity
@Table(name = "address")
public class Address {
    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    @Column(name = "ad_id", nullable = false)
    private Integer id;

    @Column(name = "street", length = 200)
    private String street;

    @Column(name = "city", length = 200)
    private String city;

////    @OneToOne(targetEntity = Employee.class)
//    @OneToOne
//    @JoinColumn(name = "ad_id")
////        @OneToOne( mappedBy = "address",
////        cascade = CascadeType.ALL,
////        fetch = FetchType.LAZY,
////        optional = false)
    @OneToOne(mappedBy = "address")
    private Employee employee;

    public Employee getEmployee() {
        return employee;
    }

    public void setEmployee(Employee employee) {
        this.employee = employee;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getStreet() {
        return street;
    }

    public void setStreet(String street) {
        this.street = street;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }


}