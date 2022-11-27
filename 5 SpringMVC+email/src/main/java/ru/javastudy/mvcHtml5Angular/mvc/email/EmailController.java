package ru.javastudy.mvcHtml5Angular.mvc.email;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

/**
 * Контроллер перехватывает post запрос и далее заполняет модель используя данные с
 * формы сайта и хардкорные данные, которые были придуманы для этой статьи.
 * Параметр @ModelAttribute(«emailModel») EmailModel emailModel создается на
 * jsp странице и будет описан чуть ниже.
 *
 * Дополнительно хочу отметить, что лучше использовать в качестве ключа статичные
 * переменные, которые были объявлены в классе EmailService,
 * т.е. вот так model.put(EmailService.FROM, «javastudy@mvc.app»);
 */
@Controller
public class EmailController {

    @Autowired
    EmailService emailService;

    @RequestMapping(value = "/email/send", method = RequestMethod.POST)
    //@ModelAttribute сама смапит на наш объект-модель-EmailModel
    //те поля которые найдет в форме email.jsp по name="name" и тд из  POST запроса
    public ModelAndView email(@ModelAttribute("emailModel") EmailModel emailModel) {
        System.out.println("EmailController email is called");
        //создаем новую мапу и заполняем ее из emailModel смапенной из POST запроса
        //для передачи в сервис информации в виде ключ-значение
        Map<String, Object> model = new HashMap<>();
        model.put("from", "sosedvovan@list.ru");
        model.put("subject", "Hello from " + emailModel.getName() + "!");
        model.put("to", emailModel.getEmail());
        model.put("ccList", new ArrayList<>());
        model.put("bccList", new ArrayList<>());
        model.put("userName", "javastudyUser");
        model.put("urljavastudy", "javastudy.ru");
        model.put("message", emailModel.getMessage());

        //вызываю свой собственный метод в сервисе тк дефолтный выдает ошибку почтового сервиса
        //мой метод не использует бин mailSender из настроек application-context.xml
        //и не будем в нем пользоваться спринговым файлом с пропертями
        boolean result = emailService.mySendEmail(model);

        //в дефолтный метод сервиса отправляем эту мапу и "registered.vm"
//        boolean result = emailService.sendEmail("registered.vm", model);

        //use redirect or you will send email after every refresh page.
        return new ModelAndView("redirect:/email.html", "resultSending", result);
    }


}
