package ru.javastudy.mvcHtml5Angular.mvc.jdbc;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import ru.javastudy.mvcHtml5Angular.mvc.bean.DBLog;
import ru.javastudy.mvcHtml5Angular.mvc.bean.User;
import ru.javastudy.mvcHtml5Angular.mvc.jdbc.JDBCExample;

import java.util.List;

/**
 *  в спринг предоставляет широкие возможности по тестированию функционала,
 *  связанного с работой с базами данных. Для примера был создан
 *  тестирующий класс JDBCExampleTest
 *  Различные методы тестируют различные операции работы с базой
 *  данных (запись, удаление, получение данных
 *  Вот примерно в такой последовательности можно объединить возможности модуля
 *  тестирования Spring и одного из самых популярных фреймворков для тестирования
 *  JUnit. Если вам необходимо серьезно покрыть тестами ваше приложение,
 *  то рекомендую ознакомиться с официальной документаций JUnit и Spring.
 *  Объем информации достаточно большой, но его изучение откроет широкие
 *  возможности для тестирования.
 */
//эти аннотации описанны в SampleBeanTest
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:mvc-config.xml", "classpath:application-context.xml"})
public class JDBCExampleTest {

    //в mvc-config.xml закоментили этот бин чтобы тесты не сыпались
//IMPORTANT - DISABLE THIS <bean class="org.springframework.web.servlet.view.XmlViewResolver"> in mvc-config.xml

    @Autowired
    private JDBCExample jdbcExample;


    //тестируем incert в таблицу LOG
    //JDBC TEMPLATE INSERT TEST EXAMPLE
    @Test
    public void insertLogTest() {
        DBLog dbLog = new DBLog(10,"test Log 10");
        Assert.assertTrue(jdbcExample.insertLog(dbLog));
    }

    //SELECT из таблицы LOG и получение всех
    //JDBC TEMPLATE SELECT TEST EXAMPLE
    @Test
    public void queryAllLogsTest() {
        //получили всех
        List<DBLog> dbLogs = jdbcExample.queryAllLogs();
        //проверили наличие элементов в листе
        Assert.assertNotNull(dbLogs);
        //в цикле вывели значения из полей объектов DBLog
        for (DBLog dbLog : jdbcExample.queryAllLogs()) {
            System.out.println("DBLog id: "+ dbLog.getIDLOG() + " DBLog logString: "+ dbLog.getLOGSTRING());
        }

    }

    //тоже самое что и выше в методе, только с User
    @Test
    public void queryAllUsers() {
        List<User> users = jdbcExample.queryAllUsers();
        Assert.assertNotNull(users);
        for (User user : jdbcExample.queryAllUsers()) {
            System.out.println("User id: "+ user.getIdUser() + " User username: "+ user.getUsername());
        }

    }

    //тест удаления User
    //JDBC TEMPLATE DELETE TEST EXAMPLE
    @Test
    public void deleteUSERTest() {
        Assert.assertTrue(jdbcExample.deleteUSER(5));
    }

    //тест "UPDATE USER SET ENABLED = ? WHERE USERNAME = ?"
    //JDBC TEMPLATE UPDATE TEST EXAMPLE
    @Test
    public void updateUserEnableTest() {
        //создали юзера
        User user = new User();
        //задали имя юзера
        user.setUsername("test1@outlook.com");
        //юзеру с заданным именем изменили его поле enable
        Assert.assertTrue(jdbcExample.updateUserEnable(user, false));

    }

	/*//TEST METHOD for Test Table inside HSQLDB
    @Test
	public void queryAllTestTableRecords() {
    	List<Map<String, Object>> rows = jdbcTemplate.queryForList("SELECT * FROM TEST");
    	for (Map<String, Object> row : rows) {
				System.out.println("TESTTABLE tectcolumn: " + row.get("TESTCOLUMN"));
		}
	}*/


}