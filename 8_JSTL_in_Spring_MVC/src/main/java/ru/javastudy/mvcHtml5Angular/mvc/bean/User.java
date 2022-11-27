package ru.javastudy.mvcHtml5Angular.mvc.bean;

import org.hibernate.validator.constraints.NotEmpty;

import javax.persistence.*;
import javax.validation.constraints.Size;

/**
 * Класс сущность User
 * Класс помечен аннотациями, которые делают из него
 * сущность и связывают его с таблицей с определенным
 * названием. Внутри сущности используются аннотации
 * для предварительной валидации, указания связывания
 * свойства класса с определенной колонкой и т.д.
 * Подробнее можете прочитать в разделе Hibernate.
 * Обратите внимание, что Spring сможет связать этот
 * класс с таблицей, т.к. он будет найден из указания
 * настройки в application-context.xml
 * (<property name = «packagesToScan» value = «ru.javastudy.mvcHtml5Angular.mvc.bean» />).
 */
@Entity
@Table(name = "USER")
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "IDUSER")
    private int idUser;

    @NotEmpty
    @Size(min = 5, max = 20)
    @Column(name = "USERNAME")
    private String username;

    @NotEmpty
    @Size(min=5, max=20)
    @Column(name="PASSWORD")
    private String password;

    @Column(name="ENABLED")
    private boolean enabled;

    public int getIdUser() {
        return idUser;
    }

    public void setIdUser(int idUser) {
        this.idUser = idUser;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public boolean isEnabled() {
        return enabled;
    }

    public void setEnabled(boolean enabled) {
        this.enabled = enabled;
    }

    @Override
    public String toString() {
        return "User{" +
                "idUser=" + idUser +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", enabled=" + enabled +
                '}';
    }
}



/**
 * Классы User и DBLog (для тестирования jdbc)
 * — сущности для тестовых
 * данных из test-data.sql. Достаточно тривиальны.
 * User Для заккомменчен тк для гибернета добавили
 * аннотаций
 *
 *
 *

public class User {

    private int idUser;
    private String username;
    private String password;
    private boolean enabled;

    public int getIdUser() {
        return idUser;
    }

    public void setIdUser(int idUser) {
        this.idUser = idUser;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public boolean isEnabled() {
        return enabled;
    }

    public void setEnabled(boolean enabled) {
        this.enabled = enabled;
    }

    @Override
    public String toString() {
        return "User{" +
                "idUser=" + idUser +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", enabled=" + enabled +
                '}';
    }
}
 */

