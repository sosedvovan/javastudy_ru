package ru.javastudy.mvcHtml5Angular.mvc.security;

import org.springframework.security.access.annotation.Secured;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.security.RolesAllowed;

/**
 * В приложение написан один небольшой контроллер,
 * который будет обрабатывать запросы с security.jsp
 *
 * В случае попытки вызова этих методов пользователем без необходимых прав будет выброшено исключение
 * org.springframework.security.access.AccessDeniedException: Access is denied.
 */
@Controller
public class SecurityController {

    //JSR-250 Security @RolesAllowed — аннотация из стандарта JSR-250.
    // Если пользователь обладает указанной ролью, то метод будет выполнен
    @RolesAllowed(value={"ROLE_SUPER_USER", "ROLE_ADMIN"})
    @RequestMapping(value = "/adminOrSuperUserCanCall", method = RequestMethod.GET)
    public ModelAndView adminOrSuperUserCanCall() {
        System.out.println("SecurityController adminOrSuperUserCanCall() is called");
        return new ModelAndView("/security/admin");
    }

    //Spring Security @PreAuthorize — аналогичная по назначению аннотация из Spring Security,
    // в которой можно использовать выражения
    //SpEL usage at method level security
    @PreAuthorize("hasRole('ADMIN') || hasRole('SUPER_USER') || hasRole('USER')")
    @RequestMapping(value= "/userOrAdminCanCallSpEL", method=RequestMethod.GET)
    public ModelAndView userOrAdminCanCall() {
        System.out.println("SecurityController userOrAdminCanCall() is called with ROLE_ADMIN or ROLE_USER");
        return new ModelAndView("/security/profile");
    }

    //Spring Security @Secured — еще один вариант проверки пользователя на обладание роли
    @Secured(value={"ROLE_ADMIN"})
    @RequestMapping(value= "/adminMethodSecured", method=RequestMethod.GET)
    public ModelAndView adminMethodSecured() {
        System.out.println("SecurityController adminMethodSecured() is called with ADMIN ROLE");
        return new ModelAndView("/security/admin");

    }
}
