package ru.javastudy.mvcHtml5Angular.mvc.cookie;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Created for JavaStudy.ru on 03.03.2016.
 */
@Controller
public class CookieController {

    //Метод readCookieExample() в качестве аргумента использует аннотацию
    // @CookieValue(value = ‘cookieName’). С помощью такой записи будет
    // выполнен поиск cookie с соответствующим именем и значение
    // будет записано в переменную Cookie cookieName.
    // Атрибут required = false позволяет избежать исключения,
    // которое будет возникать в случае отсутствия cookie.
    @RequestMapping(value = "/readCookie", method = RequestMethod.GET)
    public ModelAndView readCookieExample(@CookieValue(value = "cookieName", required = false) Cookie cookieName, HttpServletRequest request) {
        System.out.println("CookieController readCookieExample() is called");
        //you can use also " @CookieValue(value = "cookieName") String cookieName " >cookieName = Cookie.getName();
        String cookieValue = "cookie with name 'cookieName' is empty";
        if (cookieName != null) {
            cookieValue  = "Object: " + cookieName + ";<br/> Name: " + cookieName.getName() + ";<br/> Value: " + cookieName.getValue();
        }
        return new ModelAndView("/cookie/cookieView", "cookieValueObj", cookieValue);
    }

    //Метод writeCookieExample() создает cookie с временем жизни 1ч и записывает
    // в ответ клиенту.
    @RequestMapping(value = "/writeCookie", method=RequestMethod.GET)
    public String writeCookieExample (HttpServletRequest request, HttpServletResponse response) {
        System.out.println("CookieControllerExample writeCookieExample() is called");
        Cookie cookie = new Cookie("cookieName", request.getRequestURL().toString());
        cookie.setMaxAge(3600);
        response.addCookie(cookie);
        System.out.println("Object: " + cookie + "; Name: " + cookie.getName() + "; Value: " + cookie.getValue());
        return "/cookie/cookieView";

    }

//Метод readAllCookiesExample() читает все cookie, которые на данный момент
// существуют в запросе
    @RequestMapping(value = "/readAllCookies", method=RequestMethod.GET)
    public ModelAndView readAllCookiesExample(HttpServletRequest request) {
        System.out.println("CookieControllerExample readAllCookiesExample() is called");

        Cookie[] cookies = request.getCookies();
        System.out.println("All Cookies in your browsers");
        String cookiesStr = "";
        for(Cookie cookie : cookies){
            System.out.println(cookie.getName() + " : " + cookie.getValue());
            cookiesStr += cookie.getName() + " : " + cookie.getValue() + " : " + cookie + "<br/>";
        }

        return new ModelAndView("/cookie/cookieView", "cookieValueObj", cookiesStr);

    }
}