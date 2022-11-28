package ru.javastudy.mvcHtml5Angular.mvc.bean;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;


/**
 * Рассмотрим как можно тестировать корректное создание бина в контексте
 * Spring MVC, проверять какие-либо поля и переменные. Для этого был
 * создан этот класс
 */
//@RunWith — аннотация из фреймворка JUnit. С помощью нее мы указываем
// как будем запускать наш тестирующий класс. Класс, который указывается
// для этой аннотации должен быть унаследован от Runner. В нашем случае
// мы указываем класс из пакета org.springframework.test.context.junit4,
// который был подключен в pom.xml в начале статьи
@RunWith(SpringJUnit4ClassRunner.class)
//С помощью этой аннотации мы можем определить файлы конфигурации контекста
// Spring приложения. Здесь показана возможность перечисления нескольких xml
// файлов через запятую и в фигурных скобках. Далее внутри класса мы
// используем автосвязывание для получения доступа к объекту контекста
// приложения. С помощью него мы проверяем корректность создания бина,
// а также инициализацию двух полей этого бина.
@ContextConfiguration(locations = {"classpath:mvc-config.xml", "classpath:application-context.xml"})
public class SampleBeanTest {

//Comment  this 'bean class="org.springframework.web.servlet.view.XmlViewResolver" ' in mvc-context.xml
//to avoid 'Caused by: java.lang.IllegalStateException:WebApplicationObjectSupport instance
// [org.springframework.web.servlet.view.XmlViewResolve'

    @Autowired
    private ApplicationContext applicationContext;

    @Test
    public void sampleTest() {
        //из контекста спринга берем бин (над эим классом поставили @Component(value = "sampleBean"))
        SampleBean sampleBean = applicationContext.getBean("sampleBean", SampleBean.class);
        //проверяем на Null
        Assert.assertNotNull(sampleBean);

        //получаем бин другим способом
        sampleBean = (SampleBean) applicationContext.getBean("sampleBean");
        Assert.assertNotNull(sampleBean);

        //проверяем работу метода-инициализатора полей с аннотацией @PostConstruct
        Assert.assertEquals(sampleBean.getNumber(), 666);
        Assert.assertEquals(sampleBean.getStringValue(), "postConstructValue");
    }
}