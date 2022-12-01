package ru.javastudy.mvcHtml5Angular.javaconfig;

import org.springframework.web.context.ContextLoaderListener;
import org.springframework.web.context.support.AnnotationConfigWebApplicationContext;
import org.springframework.web.filter.CharacterEncodingFilter;
import org.springframework.web.servlet.DispatcherServlet;
import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;

import javax.servlet.FilterRegistration;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRegistration;

/**
 * Created for JavaStudy.ru on 28.05.2016.
 * _web.xml analogue
 */
public class WebConfig extends AbstractAnnotationConfigDispatcherServletInitializer {


    @Override
    public void onStartup(ServletContext servletContext) throws ServletException {
        //create the root Spring application context
        /**Инициализация корневого контекста
         * и добавление в него двух конфигурационных файлов
         * <context-param>
         *         <param-name>contextConfigLocation</param-name>
         *         <param-value>
         *             WEB-INF/config/application-context.xml
         *             WEB-INF/config/security-config.xml
         *         </param-value>
         *     </context-param>
         *
         *     <listener>
         *         <listener-class>org.springframework.web.context.ContextLoaderListener</listener-class>
         *     </listener>
         *     <listener>
         *         <listener-class>org.springframework.web.context.request.RequestContextListener</listener-class>
         *     </listener>
         */
        AnnotationConfigWebApplicationContext rootContext = new AnnotationConfigWebApplicationContext();
        //Конфигурация Spring Security будет рассматриваться в отдельной статье, но здесь есть два участка,
        // в которых конфигурация Security загружается в контекст приложения.
        rootContext.register(ApplicationConfig.class, SecurityConfig.class);

        servletContext.addListener(new ContextLoaderListener(rootContext));




        //Create the dispatcher servlet's Spring application context
        /** Регистрация диспетчера сервлетов и mvc конфигурации.
         * Java
         *     <servlet>
         *         <servlet-name>dispatcherServlet</servlet-name>
         *         <servlet-class>org.springframework.web.servlet.DispatcherServlet</servlet-class>
         *         <init-param>
         *             <param-name>contextConfigLocation</param-name>
         *             <param-value>/WEB-INF/config/mvc-config.xml</param-value>
         *         </init-param>
         *         <load-on-startup>1</load-on-startup>
         *     </servlet>
         *
         *     <servlet-mapping>
         *         <servlet-name>dispatcherServlet</servlet-name>
         *         <url-pattern>/</url-pattern>
         *     </servlet-mapping>
         */
        AnnotationConfigWebApplicationContext servletAppContext = new AnnotationConfigWebApplicationContext();
        servletAppContext.register(MVCConfig.class);

        DispatcherServlet dispatcherServlet = new DispatcherServlet(servletAppContext);
        // throw NoHandlerFoundException to controller ExceptionHandler.class. Used for <error-page> analogue
        dispatcherServlet.setThrowExceptionIfNoHandlerFound(true);

        //register and map the dispatcher servlet
        //note Dispatcher servlet with constructor arguments
        ServletRegistration.Dynamic dispatcher = servletContext.addServlet("dispatcher", dispatcherServlet);
        dispatcher.setLoadOnStartup(1);
        dispatcher.addMapping("/");


        /** Добавление фильтра кодирования символов
         * Java
         *     <!--Позволяет работать с русскими символами-->
         *     <filter>
         *         <filter-name>encodingFilter</filter-name>
         *         <filter-class>org.springframework.web.filter.CharacterEncodingFilter</filter-class>
         *         <init-param>
         *             <param-name>encoding</param-name>
         *             <param-value>UTF-8</param-value>
         *         </init-param>
         *         <init-param>
         *             <param-name>forceEncoding</param-name>
         *             <param-value>true</param-value>
         *         </init-param>
         *     </filter>
         *     <filter-mapping>
         *         <filter-name>encodingFilter</filter-name>
         *         <url-pattern>/*</url-pattern>
         *     </filter-mapping>
         */
        FilterRegistration.Dynamic encodingFilter = servletContext.addFilter("encoding-filter", new CharacterEncodingFilter());
        encodingFilter.setInitParameter("encoding", "UTF-8");
        encodingFilter.setInitParameter("forceEncoding", "true");
        encodingFilter.addMappingForUrlPatterns(null, true, "/*");

    }

    /**
     * added to load spring security filter in root context
     * (created in onStartup())
     *
     * Здесь регистрируется класс с конфигурацией Spring Security.
     * Но  если оставить только этот код, то мы будем получать ошибки
     * при загрузке (или компиляции) приложения. Например для этого
     * приложения сразу будет падать на @Autowired DataSource.
     * Дело в том, что конфигурация spring security должна быть
     * загружена в тот же контекст, который мы создаем в методе onStartup().
     * Это делается с помощью метода getRootConfigClasses().
     */
    @Override
    protected Class<?>[] getRootConfigClasses() {
        return new Class[] {SecurityConfig.class};
    }

    @Override
    protected String[] getServletMappings() {
        return new String[0];
    }

    @Override
    protected Class<?>[] getServletConfigClasses() {
        return new Class<?>[0];
    }
}
