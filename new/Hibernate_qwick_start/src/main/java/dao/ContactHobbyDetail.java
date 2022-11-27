package dao;

import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;

import javax.persistence.*;

@Entity
@Table(name = "contact_hobby_detail")
public class ContactHobbyDetail {
    @EmbeddedId
    private ContactHobbyDetailId id;

    @MapsId("contactId")
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @OnDelete(action = OnDeleteAction.CASCADE)
    @JoinColumn(name = "contact_id", nullable = false)
    private Contact contact;

    @MapsId("hobbyId")
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "hobby_id", nullable = false)
    private Hobby hobby;

    public ContactHobbyDetailId getId() {
        return id;
    }

    public void setId(ContactHobbyDetailId id) {
        this.id = id;
    }

    public Contact getContact() {
        return contact;
    }

    public void setContact(Contact contact) {
        this.contact = contact;
    }

    public Hobby getHobby() {
        return hobby;
    }

    public void setHobby(Hobby hobby) {
        this.hobby = hobby;
    }

}