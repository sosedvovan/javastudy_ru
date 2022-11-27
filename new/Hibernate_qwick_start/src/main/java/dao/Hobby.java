package dao;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "hobby")
public class Hobby {
    @Id
    @Column(name = "hobby_id", nullable = false, length = 20)
    private String id;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    //TODO [JPA Buddy] generate columns from DB
}