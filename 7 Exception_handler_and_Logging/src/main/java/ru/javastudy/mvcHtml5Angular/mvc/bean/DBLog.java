package ru.javastudy.mvcHtml5Angular.mvc.bean;

import javax.xml.bind.annotation.XmlElement;
import java.io.Serializable;

/**
 * Классы User и DBLog — сущности для тестовых
 * данных из test-data.sql. Достаточно тривиальны
 * DBLog (аннотация XMLElement здесь не нужна и осталась
 * из полного проекта. Будет использоваться в статьях по XML, JSON):
 */
public class DBLog implements Serializable {

    private static final long serialVersionUID = 1L;
    private int IDLOG;
    private String LOGSTRING;

    public DBLog() {
    }

    public DBLog (int idLog, String logString) {
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
