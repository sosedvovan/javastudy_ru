package ru.javastudy.mvcHtml5Angular.javaconfig;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.support.ReloadableResourceBundleMessageSource;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;
import org.springframework.http.converter.HttpMessageConverter;
import org.springframework.http.converter.json.MappingJackson2HttpMessageConverter;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.config.annotation.*;
import org.springframework.web.servlet.i18n.CookieLocaleResolver;
import org.springframework.web.servlet.i18n.LocaleChangeInterceptor;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.XmlViewResolver;
import ru.javastudy.mvcHtml5Angular.mvc.interceptors.SiteInterceptor;

import java.util.List;
import java.util.Locale;

/**
 * Created for JavaStudy.ru on 28.05.2016.
 * mvc-config.xml analogue
 */
@EnableWebMvc  //<mvc:annotation-driven>
@Configuration
//<context:component-scan base-package="ru.javastudy.mvcHtml5Angular.mvc" />
@ComponentScan(basePackages = {"ru.javastudy.mvcHtml5Angular.mvc"})
@EnableTransactionManagement //<tx:annotation-driven/>  activate @Transactional JPA annotation
public class MVCConfig extends WebMvcConfigurerAdapter {

    /**
     * <mvc:resources mapping="/resources/**" location="/resources/" />
     */
    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/resources/**").addResourceLocations("/resources/");
    }



    /**
     * bean class="org.springframework.web.servlet.view.InternalResourceViewResolver">
     * Java
     *     <!-- ViewResolver bean config for mapping strings to jsp views -->
     *     <bean class="org.springframework.web.servlet.view.InternalResourceViewResolver">
     *         <!-- Example: a logical view name of 'showMessage' is mapped to '/WEB-INF/jsp/showMessage.jsp' -->
     *         <property name="order" value="1" />
     *         <property name="prefix" value="/WEB-INF/view/" />
     *         <property name="suffix" value=".jsp" />
     *     </bean>
     */
    @Bean
    public InternalResourceViewResolver jspViewResolver() {
        InternalResourceViewResolver viewResolver = new InternalResourceViewResolver();
        viewResolver.setOrder(1);
        viewResolver.setPrefix("/WEB-INF/view/");
        viewResolver.setSuffix(".jsp");
        return viewResolver;
    }

    /**
     *     <mvc:view-controller path="/about.html" view-name="/about/about"/>
     *
     * <mvc:view-controller path="/" view-name="/index"/>
     * <mvc:view-controller path="/index.html" view-name="/index"/>
     * <mvc:view-controller path="/login.html" view-name="/form/login"/>
     * <mvc:view-controller path="/about.html" view-name="/about/about"/>
     * <mvc:view-controller path="/file.html" view-name="/file/file"/>
     *
     * //и т.д.
     */
    @Override
    public void addViewControllers(ViewControllerRegistry registry) {
        super.addViewControllers(registry);
        registry.addViewController("/").setViewName("forward:/index.html");
        registry.addViewController("/about.html").setViewName("/about/about");
        registry.addViewController("/index.html").setViewName("/index");

        registry.addViewController("/").setViewName("/index");
        registry.addViewController("/index.html").setViewName("/index");
        registry.addViewController("/login.html").setViewName("/form/login");
        registry.addViewController("/about.html").setViewName("/about/about");
        registry.addViewController("/file.html").setViewName("/file/file");
        registry.addViewController("/jdbc.html").setViewName("/jdbc/jdbc");
        registry.addViewController("/email.html").setViewName("/email/email");
        registry.addViewController("/rest.html").setViewName("/rest/rest");
        registry.addViewController("/orm.html").setViewName("/orm/orm");
        registry.addViewController("/jstl.html").setViewName("/jstl/jstl");
        registry.addViewController("/scope.html").setViewName("/scope/scope");
        registry.addViewController("/cookie.html").setViewName("/cookie/cookieView");
        registry.addViewController("/security.html").setViewName("/security/security");
        registry.addViewController("/security/admin.html").setViewName("/security/admin");

        registry.addViewController("/angularIndex.html").setViewName("/angularjs/angularindex");
        registry.addViewController("/angularjson.html").setViewName("/angularjs/angularjson");
        registry.addViewController("/expressions.html").setViewName("/angularjs/expressions");
        registry.addViewController("/ng-bind-model.html").setViewName("/angularjs/ng-bind-model");
        registry.addViewController("/ng-class.html").setViewName("/angularjs/ng-class");
        registry.addViewController("/ng-click-show.html").setViewName("/angularjs/ng-click-show");
        registry.addViewController("/ng-if-switch.html").setViewName("/angularjs/ng-if-switch");
        registry.addViewController("/ng-init.html").setViewName("/angularjs/ng-init");
        registry.addViewController("/ng-repeat.html").setViewName("/angularjs/ng-repeat");
        registry.addViewController("/two-way-binding.html").setViewName("/angularjs/two-way-binding");
        registry.addViewController("/angularDI.html").setViewName("/angularjs/angularDI");
        registry.addViewController("/ng-controller.html").setViewName("/angularjs/ng-controller");
        registry.addViewController("/angularfilters.html").setViewName("/angularjs/filters");
        registry.addViewController("/angularvalidation.html").setViewName("/angularjs/validation");
        registry.addViewController("/angularrouting.html").setViewName("/angularjs/routing");
        registry.addViewController("/angularhttpresource.html").setViewName("/angularjs/httpresource");
        registry.addViewController("/customdirective.html").setViewName("/angularjs/customdirective");
        registry.addViewController("/html5.html").setViewName("/html5/html5");
    }



    /**
     *
     * <mvc:annotation-driven>
     *         <!--use int RestController to produce pretty json response-->
     *         <mvc:message-converters>
     *             <bean id="jacksonHttpMessageConverter" class="org.springframework.http.converter.json.MappingJackson2HttpMessageConverter">
     *                 <property name="prettyPrint" value="true" />
     *             </bean>
     *         </mvc:message-converters>
     *     </mvc:annotation-driven>
     */
    @Override
    public void configureMessageConverters(List<HttpMessageConverter<?>> converters) {
        converters.add(getJacksonHttpMessageConverter());
    }

    @Bean(name = "jacksonHttpMessageConverter")
    public MappingJackson2HttpMessageConverter getJacksonHttpMessageConverter() {
        MappingJackson2HttpMessageConverter converter = new MappingJackson2HttpMessageConverter();
        converter.setPrettyPrint(true);
        return converter;
    }

    /**
     * <bean id="multipartResolver" class="org.springframework.web.multipart.commons.CommonsMultipartResolver">
     *     <!-- File Upload bean config-->
     *     <bean id="multipartResolver" class="org.springframework.web.multipart.commons.CommonsMultipartResolver">
     *         <!-- set the maximum file size in bytes -->
     *         <property name="maxUploadSize" value="1000000"/>
     *     </bean>
     */
    @Bean(name = "multipartResolver")
    public CommonsMultipartResolver getMultipartResolver() {
        CommonsMultipartResolver cmr = new CommonsMultipartResolver();
        cmr.setMaxUploadSize(1000000);
        return cmr;
    }

    /**
     *  <bean class="org.springframework.web.servlet.view.XmlViewResolver">
     *
     *     <bean class="org.springframework.web.servlet.view.XmlViewResolver">
     *         <property name="order" value="0" />
     *         <property name="location" value="/excel-pdf-config.xml"/>
     *     </bean>
     *
     *  Здесь стоит обратить внимание, что excel-pdf-config.xml не переписывался,
     *  а был перенесен в src/resources.
     */
    @Bean(name = "xmlViewResolver")
    public XmlViewResolver getXmlViewResolver() {
        XmlViewResolver xmlViewResolver = new XmlViewResolver();
        Resource resource = new ClassPathResource("excel-pdf-config.xml");//note it in java resources, not webapp
        xmlViewResolver.setOrder(0);
        xmlViewResolver.setLocation(resource);
        return xmlViewResolver;
    }

    /**
     *  <mvc:interceptors>
     *
     *  <mvc:interceptors>
     *         <mvc:interceptor>
     *             <mvc:mapping path="/interceptorCall/*"/>
     *             <!--need to use ' /** ' not ' /* ' if you want to intercept all requests.-->
     *             <!--<mvc:mapping path="/**"/>-->
     *             <bean class="ru.javastudy.mvcHtml5Angular.mvc.interceptors.SiteInterceptor"/>
     *         </mvc:interceptor>
     *
     *         <mvc:interceptor>
     *             <mvc:mapping path="/*" />
     *             <bean id="localeChangeInterceptor" class="org.springframework.web.servlet.i18n.LocaleChangeInterceptor">
     *                 <property name="paramName" value="languageVar" />
     *             </bean>
     *         </mvc:interceptor>
     *     </mvc:interceptors>
     *
     *     где SiteInterceptor — компонент (бин) из пакета interceptors.
     *     Описан в теме о перехватчиках (см. содержание)
     */
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(siteInterceptor).addPathPatterns("/interceptorCall/*");
        registry.addInterceptor(getLocaleChangeInterceptor()).addPathPatterns("/*");
    }

    @Bean(name = "localeChangeInterceptor")
    public LocaleChangeInterceptor getLocaleChangeInterceptor() {
        LocaleChangeInterceptor localeChangeInterceptor = new LocaleChangeInterceptor();
        localeChangeInterceptor.setParamName("languageVar");
        return localeChangeInterceptor;
    }

    @Autowired
    private SiteInterceptor siteInterceptor;

    /**
     *  <bean id="localeResolver" class="org.springframework.web.servlet.i18n.CookieLocaleResolver">
     *
     *     <bean id="localeResolver" class="org.springframework.web.servlet.i18n.CookieLocaleResolver">
     *         <property name="defaultLocale" value="ru" />
     *         <!-- cookieMaxAge in seconds. if you set it to -1, the cookie will be deleted when browser is closed) -->
     *         <property name="cookieMaxAge" value="100000"/>
     *     </bean>
     */
    @Bean(name = "localeResolver")
    public CookieLocaleResolver getLocaleResolver() {
        CookieLocaleResolver cookieLocaleResolver = new CookieLocaleResolver();
        cookieLocaleResolver.setDefaultLocale(new Locale("ru"));
        cookieLocaleResolver.setCookieMaxAge(100000);
        return cookieLocaleResolver;
    }

    /**
     * <bean id="messageSource" class="org.springframework.context.support.ReloadableResourceBundleMessageSource">
     *
     *     <!-- MessageSource ReloadableResourceBundleMessageSource configuration -->
     *     <bean id="messageSource" class="org.springframework.context.support.ReloadableResourceBundleMessageSource">
     *         <property name="basenames" value="classpath:/locales/messages"/>
     *         <property name="cacheSeconds" value="1"/>
     *         <property name="defaultEncoding" value="UTF-8" />
     *     </bean>
     */
    @Bean(name = "messageSource")
    public ReloadableResourceBundleMessageSource getMessageSource() {
        ReloadableResourceBundleMessageSource resource = new ReloadableResourceBundleMessageSource();
        resource.setBasename("classpath:/locales/messages");
        resource.setCacheSeconds(1);
        resource.setDefaultEncoding("UTF-8");
        return resource;
    }
}
