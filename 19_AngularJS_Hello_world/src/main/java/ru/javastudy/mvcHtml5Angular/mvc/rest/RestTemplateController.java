package ru.javastudy.mvcHtml5Angular.mvc.rest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;
import ru.javastudy.mvcHtml5Angular.mvc.rest.model.RestPostsModel;
import ru.javastudy.mvcHtml5Angular.mvc.rest.model.RestUserModel;

import java.util.Arrays;
import java.util.List;

/**
 * Класс RestTemplate — служит для доступа к REST данным на удаленном веб сервере.
 * Это своего рода аналог JDBCTemplate (Spring MVC и JDBC (Spring JDBC example).
 * Подключение и настройка JDBC datasource, пример работы с JDBC в Spring).
 * Напомню, что бин RestTemplate был прописан в файле конфигурации Spring в
 * начале статьи. Мы будем использовать сгенерированный ответ со стороннего
 * веб сервера (http://jsonplaceholder.typicode.com). Он будет генерировать объекты
 * вроде «Посты пользователя» или «Пользователь (описание)». Контроллер, который
 * будет демонстрировать работу с RestTemplate и обработку данных с внешнего веб
 * сервера выглядит так:
 */

//Сразу можно обратить внимание на аннотацию @RestController. Такая запись
// автоматически добавляет аннотацию @ResponseBody во все методы внутри класса.
// Далее с помощью связывание мы получаем доступ к объекту RestTemplate,
// с помощью которого мы будем преобразовывать данные ответа внешнего сервера
// (который указан в переменной EXTERNAL_REST_URL).

    //??Далее следует обратить внимание на метод restTemplate.getForEntity().
// С помощью этого метода мы преобразовываем REST ответ сервера в нашу сущность.
//     ResponseEntity<RestPostsModel[]> response = restTemplate.getForEntity(
//                EXTERNAL_REST_URL +"/posts",
//                RestPostsModel[].class
//        );

@RestController //will add automatically the @ResponseBody annotation to all methods
public class RestTemplateController {

    /**
     * Accessing a third-party REST service inside a Spring application
     * it can even bind that data to custom domain types.
     */
    @Autowired
    private RestTemplate restTemplate;

    private final String EXTERNAL_REST_URL = "http://jsonplaceholder.typicode.com"; //free JSON services

    @RequestMapping(value = "/rest/users", method = RequestMethod.GET)
    public List<RestUserModel> getRestUsers() {
        System.out.println("RestTemplateController getRestUsers is called");

        HttpHeaders headers = new HttpHeaders();
        headers.setAccept(Arrays.asList(MediaType.APPLICATION_JSON));
        headers.set("User-Agent", "Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:49.0) Gecko/20100101 Firefox/49.0");
        HttpEntity<String> entity = new HttpEntity<String>("parameters", headers);
        //JSON http://jsonplaceholder.typicode.com/users
        ResponseEntity<RestUserModel[]> response = restTemplate.exchange(
                EXTERNAL_REST_URL +"/users",
                HttpMethod.GET,
                entity,
                RestUserModel[].class
        );
        return Arrays.asList(response.getBody());
    }

    @RequestMapping(value = "/rest/posts", method = RequestMethod.GET)
    public List<RestPostsModel> getRestPosts() {
        System.out.println("RestTemplateController getRestPosts is called");

        HttpHeaders headers = new HttpHeaders();
        headers.setAccept(Arrays.asList(MediaType.APPLICATION_JSON));
        headers.set("User-Agent", "Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:49.0) Gecko/20100101 Firefox/49.0");
        HttpEntity<String> entity = new HttpEntity<String>("parameters", headers);

        ResponseEntity<RestPostsModel[]> response = restTemplate.exchange(
                EXTERNAL_REST_URL +"/posts",
                HttpMethod.GET,
                entity,
                RestPostsModel[].class
        );
        return Arrays.asList(response.getBody());
    }

    @RequestMapping(value = "/rest/posts/{param}", method = RequestMethod.GET)
    public RestPostsModel getRestPostsById(@PathVariable("param") String param) {
        System.out.println("RestTemplateController getRestPostsById is called");

        HttpHeaders headers = new HttpHeaders();
        headers.setAccept(Arrays.asList(MediaType.APPLICATION_JSON));
        headers.set("User-Agent", "Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:49.0) Gecko/20100101 Firefox/49.0");
        HttpEntity<String> entity = new HttpEntity<String>("parameters", headers);

        ResponseEntity<RestPostsModel> response = restTemplate.exchange(
                EXTERNAL_REST_URL +"/posts/" + param,
                HttpMethod.GET,
                entity,
                RestPostsModel.class
        );
        return response.getBody();
    }

    //JSON Deletes a post
    //Так же вы могли заметить методы по возврату поста по ID, удаление поста.
    // Эти методы демонстрируют работу других методов, которые могут быть использованы
    // в RESTful веб сервисах. Их реализацию можете посмотреть внутри проекта.
    @RequestMapping(value = "/rest/delPosts/{postId}", method = RequestMethod.GET)
    @ResponseStatus(value = HttpStatus.OK)
    public void deletePostByID(@PathVariable(value="postId") String postId) {

        HttpHeaders headers = new HttpHeaders();
        headers.setAccept(Arrays.asList(MediaType.APPLICATION_JSON));
        headers.set("User-Agent", "Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:49.0) Gecko/20100101 Firefox/49.0");
        HttpEntity<String> entity = new HttpEntity<String>("parameters", headers);

        //in test case 100 posts. Try to del id 100+ (id=150 for example) and check status in console
        restTemplate.exchange(EXTERNAL_REST_URL +"/posts/" + postId, HttpMethod.DELETE, entity, String.class);
        System.out.println("@RestTemplateControllerExample deletePostByID is called");
    }

    @ExceptionHandler
    @ResponseStatus(value = HttpStatus.FORBIDDEN,reason="FORBIDDEN ACCESS (PROVIDE YOUR CUSTOM REASON HERE)")
    public void handleException(Exception ex) {
        System.out.println("@RestTemplateControllerExample handleException");
        System.out.println(ex);
    }

    //JSON SAVES a post. Uses in angularjs/httpresource.jsp
    @RequestMapping(value = "/rest/savePost", method = RequestMethod.POST)
    @ResponseStatus(value = HttpStatus.OK)
    public void savePost(@RequestBody RestPostsModel postJSON) {
        System.out.println("savePost postJSON.getUserId(): " + postJSON.getUserId());
        System.out.println("savePost postJSON.getTitle(): " + postJSON.getTitle());
        System.out.println("savePost postJSON.getId(): " + postJSON.getId());
        System.out.println("savePost postJSON.getBody(): " + postJSON.getBody());
        System.out.println("@RestTemplateControllerExample savePost is called");
    }
}

