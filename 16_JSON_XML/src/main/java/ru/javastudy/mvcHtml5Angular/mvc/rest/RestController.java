package ru.javastudy.mvcHtml5Angular.mvc.rest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import ru.javastudy.mvcHtml5Angular.mvc.rest.model.DBLogJSON;
import ru.javastudy.mvcHtml5Angular.mvc.rest.model.DBLogXML;
import ru.javastudy.mvcHtml5Angular.mvc.rest.model.DBLogsJSON;
import ru.javastudy.mvcHtml5Angular.mvc.rest.model.DBLogsXML;
import ru.javastudy.mvcHtml5Angular.mvc.service.DBLogService;

import java.util.List;

/**
 * Для демонстрации работы по преобразованию обычных java классов в xml или JSON форматы был создан
 * обычный Spring controller класс — RestController.
 */
//Вначале указываем приложению, что этот класс является
// контроллером с помощью аннотации @Controller.
@Controller
public class RestController {

    //Затем используя автосвязывание @Autowired получаем доступ к классу DBLogService.
    // Этот сервисный класс предоставляет методы для доступа к данным из нашей
    // встроенной in-memory H2 базы данных. Откуда берутся данные было описано в
    // предыдущих статьях (смотрите Spring MVC и JDBC)

// Над методами указывается атрибут produces, который указывает в какой формат
// данных должен быть преобразован ответ метода. Указание на то, что ответ должен
// быть преобразован в JSON или XML формат дает аннотация @ResponseBody.
///
    @Autowired
    private DBLogService dbLogService;

    @RequestMapping(value = "/rest/getAllDBLogsXML", method = RequestMethod.GET, produces = "application/xml")
    public @ResponseBody DBLogsXML getAllDBLogsXML() {
        List<DBLogXML> dbLogsList = null;
        try {
            dbLogsList = dbLogService.queryAllDBLogsXML();  //JPA (Hibernate)
//            dbLogsList = dbLogService.queryAllDBLogsJDBCExampleXML(); //JDBC
        } catch (Exception e) {
            e.printStackTrace();
        }
        System.out.println(dbLogsList);
        DBLogsXML dbLogsXML = new DBLogsXML();
        dbLogsXML.setLogList(dbLogsList);
        return dbLogsXML;
    }

    /** look to mvc-config.xml for <mvc:message-converters>. It can produce 'pretty' json response. */
    @RequestMapping(value = "/rest/getAllDBLogsJSON", method = RequestMethod.GET, produces = "application/json")
    public @ResponseBody DBLogsJSON getAllDBLogsJSON() {
        List<DBLogJSON> dbLogsJSONList = null;
        try {
            dbLogsJSONList = dbLogService.queryAllDBLogsJSON();  //JPA (Hibernate)
//            dbLogsJSONList = dbLogService.queryAllDBLogsJDBCExampleJSON(); //JDBC
        } catch (Exception e) {
            e.printStackTrace();
        }
        System.out.println(dbLogsJSONList);
        DBLogsJSON dbLogsJSON = new DBLogsJSON();
        dbLogsJSON.setLogList(dbLogsJSONList);
        return dbLogsJSON;
    }
}
