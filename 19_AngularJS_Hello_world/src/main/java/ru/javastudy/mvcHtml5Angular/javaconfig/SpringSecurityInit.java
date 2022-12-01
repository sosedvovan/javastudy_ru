package ru.javastudy.mvcHtml5Angular.javaconfig;

import org.springframework.security.web.context.AbstractSecurityWebApplicationInitializer;

/**
 * Created for JavaStudy.ru on 30.05.2016.
 * Automatically register the springSecurityFilterChain Filter for every URL in your application
 * Add a ContextLoaderListener that loads the SecurityConfig.
 *
 * Чтобы включить настройку из web.xml —
 * springSecurityFilterChain необходимо создать следующий класс и
 * унаследоваться от AbstractSecurityWebApplicationInitializer.
 * Такая короткая запись сделает полный аналог для фильтра из web.xml.
 * Так же не забывайте о инициализации конфигурации класса SpringConfig
 * в классе WebConfig, описанной в первой части перехода с xml к java config.
 *
 *  <filter>
 *         <filter-name>springSecurityFilterChain</filter-name>
 *         <filter-class>org.springframework.web.filter.DelegatingFilterProxy</filter-class>
 *     </filter>
 *     <filter-mapping>
 *         <filter-name>springSecurityFilterChain</filter-name>
 *         <url-pattern>/*</url-pattern>
 *     </filter-mapping>
 */
public class SpringSecurityInit extends AbstractSecurityWebApplicationInitializer {
}
