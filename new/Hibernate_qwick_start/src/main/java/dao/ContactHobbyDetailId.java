package dao;

import org.hibernate.Hibernate;

import javax.persistence.Column;
import javax.persistence.Embeddable;
import javax.persistence.Entity;
import java.io.Serializable;
import java.util.Objects;

@Embeddable
public class ContactHobbyDetailId implements Serializable {
    private static final long serialVersionUID = 4267431208487672542L;
    @Column(name = "contact_id", nullable = false)
    private Integer contactId;

    @Column(name = "hobby_id", nullable = false, length = 20)
    private String hobbyId;

    public Integer getContactId() {
        return contactId;
    }

    public void setContactId(Integer contactId) {
        this.contactId = contactId;
    }

    public String getHobbyId() {
        return hobbyId;
    }

    public void setHobbyId(String hobbyId) {
        this.hobbyId = hobbyId;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || Hibernate.getClass(this) != Hibernate.getClass(o)) return false;
        ContactHobbyDetailId entity = (ContactHobbyDetailId) o;
        return Objects.equals(this.contactId, entity.contactId) &&
                Objects.equals(this.hobbyId, entity.hobbyId);
    }

    @Override
    public int hashCode() {
        return Objects.hash(contactId, hobbyId);
    }

}