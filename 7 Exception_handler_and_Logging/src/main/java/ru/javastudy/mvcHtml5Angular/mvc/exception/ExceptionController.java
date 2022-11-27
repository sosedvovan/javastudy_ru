package ru.javastudy.mvcHtml5Angular.mvc.exception;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Контроллер ну очень простой. При переходе по ссылке вида
 * /runtimeException в методе будет искусственно выброшено RuntimeException исключение.
 * Это исключение мы будет обрабатывать в классе, который реализует интерфейс
 * HandlerExceptionResolver. В Spring MVC достаточно реализовать этот интерфейс
 * для перехвата исключений и их обработке по своему усмотрению:
 */
@Controller
public class ExceptionController {

    @RequestMapping(value = "/runtimeException", method = RequestMethod.GET)
    public void throwException() {
        throw new RuntimeException();
    }
}
