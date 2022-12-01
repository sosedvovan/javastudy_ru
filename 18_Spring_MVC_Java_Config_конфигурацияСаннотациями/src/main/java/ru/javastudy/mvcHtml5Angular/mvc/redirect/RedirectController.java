package ru.javastudy.mvcHtml5Angular.mvc.redirect;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;

/**
 *  обычный контроллер, который выполняет переадресацию на сайт javastudy.ru.
 *  Обратите внимание на конкатенацию с request.getScheme().
 *  Это рекомендуется делать, если вы не знаете какой протокол
 *  используется (http, https, ftp и т.д.).
 *  Если вам необходимо сделать проброс, а не переадресацию,
 *  то нужно просто использовать префикс forward: вместо redirect:
 *
 *  С точки зрения SQL при операциях SELECT нужно использовать forward,
 *  а для INSERT, UPDATE, DELETE — redirect.
 */
@Controller
public class RedirectController {

    //redirect to external URL
    @RequestMapping(value = "/redirectExample", method = RequestMethod.GET)
    public String redirectExample(HttpServletRequest request) {

        //request.getScheme() - if you don't know where was the request sent: http, https, ftp..

//        редирект на сторонний сайт
//        return "redirect:" + request.getScheme() +"://javastudy.ru";
//        редирект на страницу нашего сайта
//        return "redirect: /email.html";
//        редирект на другой контроллер
//        return "redirect: /runtimeException";
//        форвард на другой контроллер (в урл останемся на прежней странице)
        return "forward: /runtimeException";
    }
}