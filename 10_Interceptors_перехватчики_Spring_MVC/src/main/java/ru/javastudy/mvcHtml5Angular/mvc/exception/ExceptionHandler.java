package ru.javastudy.mvcHtml5Angular.mvc.exception;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * исключение мы будет обрабатывать в классе, который реализует интерфейс HandlerExceptionResolver. В Spring MVC
 * достаточно реализовать этот интерфейс для перехвата исключений и их обработке по своему
 * усмотрению.
 * При перехвате исключения мы можем запрограммировать любое поведение. Здесь мы просто логируем ошибку и
 * передаем ViewResolver представление, на которое мы должны быть переброшены (в данном случае на
 * страницу exception.jsp) и саму ошибку в переменной exceptionMsg.
 *
 * Обратите внимание — оба класса отмечены аннотацией @Component и поэтому они оба будут находиться в контексте spring
 * приложения и работать как нам нужно.
 */
@Component
public class ExceptionHandler implements HandlerExceptionResolver {

    private static final Logger logger = LoggerFactory.getLogger(ExceptionHandler.class);

    @Override
    public ModelAndView resolveException(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse,
                                         Object o, Exception e) {
        System.out.println("Spring MVC ExceptionHandler handling");
        logger.error("ErrorLog: ", e);
        //На странице "error/exception.jsp" просто выводится сообщение, которое записано в
        // объекте {exceptionMsg}
        return new ModelAndView("/error/exception", "exceptionMsg", "ExceptionHandler msg: " + e.toString());
    }
}
