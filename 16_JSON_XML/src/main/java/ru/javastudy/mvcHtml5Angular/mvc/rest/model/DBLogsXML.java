package ru.javastudy.mvcHtml5Angular.mvc.rest.model;

import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;
import java.util.List;

/**
 * Если нам необходимо показать список элементов, то мы можем использовать
 * аннотацию @XmlRootElement, который задаст корневой элемент, а далее
 * с помощью указания @XmlElement будут отображены все объекты массива.
 *
 * Объекты с суффиксом JSON точно такие же, только без указания аннотаций относящихся к XML.
 */
@XmlRootElement(name = "LOGS")
public class DBLogsXML {

    private List<DBLogXML> logList;

    @XmlElement(name = "LOG")
    public List<DBLogXML> getLogList() {
        return logList;
    }

    public void setLogList(List<DBLogXML> logList) {
        this.logList = logList;
    }
}
