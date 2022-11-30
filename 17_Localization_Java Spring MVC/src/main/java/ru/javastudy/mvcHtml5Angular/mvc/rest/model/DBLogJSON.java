package ru.javastudy.mvcHtml5Angular.mvc.rest.model;

import javax.persistence.*;
import java.io.Serializable;

/**
 * Для того, чтобы преобразование класса в XML формат прошло успешно,
 * нам необходимо использовать аннотации @XmlRootElement и\или @XmlElement.
 * Для JSON формата ничего дополнительно в классе указывать не нужно!
 *
 * У нас используется несколько java классов, которые будут преобразовываться
 * в xml или json ответ клиенту: DBLogJSON, DBLogsJSON, DBLogXML, DBLogsXML,
 * RestPostsModel, RestUserModel.
 * DBLog — класс, который имеет две переменных экземпляра — id, и строку
 * (с описанием логов). Два последних класса RestPostModel и RestUserModel —
 * классы, которые используются для отображения данных со стороннего ресурса и
 * будут описаны в пункте по RestTemplate.
 */
@Entity //use for JPA. For JDBC you can clear this
@Table(name = "LOG")
public class DBLogJSON implements Serializable {

    private static final long serialVersionUID = 1L;

    @Column(name = "IDLOG")
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int IDLOG;
    
    @Column(name = "LOGSTRING")
    private String LOGSTRING;

    public DBLogJSON() {
    }

    public DBLogJSON(int idLog, String logString) {
        this.IDLOG = idLog;
        this.LOGSTRING = logString;
    }

    public int getIDLOG() {
        return IDLOG;
    }


    public void setIDLOG(int iDLOG) {
        IDLOG = iDLOG;
    }

    public String getLOGSTRING() {
        return LOGSTRING;
    }

    public void setLOGSTRING(String lOGSTRING) {
        LOGSTRING = lOGSTRING;
    }
}
