package ru.javastudy.mvcHtml5Angular.mvc.rest.model;

import javax.persistence.*;
import javax.xml.bind.annotation.XmlElement;
import java.io.Serializable;

/**
 * Тут следует обратить внимание на аннотацию @XmlElement. С помощью нее класс будет
 * преобразовывать переменные экземпляра в XML элемент. Остальные аннотации относятся
 * к маппингу таблицы из базы данных на сущность. Если нам необходимо показать список
 * элементов, то мы можем использовать аннотацию @XmlRootElement, который задаст
 * корневой элемент, а далее с помощью указания @XmlElement будут отображены все
 * объекты массива.
 */
@Entity //use for JPA. For JDBC you can clear this
@Table(name = "LOG")
public class DBLogXML implements Serializable {

    private static final long serialVersionUID = 1L;
    @Column(name = "IDLOG")
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int IDLOG;
    @Column(name = "LOGSTRING")
    private String LOGSTRING;

    public DBLogXML() {
    }

    public DBLogXML(int idLog, String logString) {
        this.IDLOG = idLog;
        this.LOGSTRING = logString;
    }

    public int getIDLOG() {
        return IDLOG;
    }

    @XmlElement
    public void setIDLOG(int iDLOG) {
        IDLOG = iDLOG;
    }

    public String getLOGSTRING() {
        return LOGSTRING;
    }

    @XmlElement
    public void setLOGSTRING(String lOGSTRING) {
        LOGSTRING = lOGSTRING;
    }
}
