package dao.OneToOne;

import javax.persistence.*;

@Entity
@Table(name = "employee")
public class Employee {
    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Integer id;

    @Column(name = "firstName", length = 200)
    private String firstName;

    @Column(name = "lastName", length = 200)
    private String lastName;

//    @OneToOne(mappedBy = "employee",
//            cascade = CascadeType.ALL,
//            fetch = FetchType.LAZY,
//            optional = false)
    @OneToOne
    @JoinColumn(name = "fk_ad_id")
    private Address address;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public Address getAddress() {
        return address;
    }

    public void setAddress(Address address) {
        this.address = address;
    }


}