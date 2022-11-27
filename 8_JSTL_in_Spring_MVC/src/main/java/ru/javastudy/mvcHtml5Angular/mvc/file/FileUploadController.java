
package ru.javastudy.mvcHtml5Angular.mvc.file;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;

/**
 * Для загрузки файла Spring MVC используется свой интерфейс MultipartResolver
 * (мы будем использовать реализующий его класс CommonsMultipartResolver).
 * Работа с ним очень простая. Всё что нужно сделать — указать маппинг,
 * по которому контроллер перехватит запрос на закачку файла. Далее в классе
 * используется стандартная работа с потоками байт и запись файла.
 */
@Controller
public class FileUploadController {

    @RequestMapping(value = "/uploadFile", method = RequestMethod.POST)
    public @ResponseBody String handleFileUpload(@RequestParam("file") MultipartFile file) {

        if (!file.isEmpty()) {

            try {

                //в созданный массив кладем байтики файла
                byte[] fileBytes = file.getBytes();
                //в стрингу берем путь к папке томката
                String rootPath = System.getProperty("catalina.home");
                //сервисные сообщения
                System.out.println("Server rootPath: " + rootPath);
                System.out.println("File original name: " + file.getOriginalFilename());
                System.out.println("File content type: " + file.getContentType());

                //создаем объект файла с путем в томкат и именем как у оригинального файла
                File newFile = new File(rootPath + File.separator + file.getOriginalFilename());
                //в стрим берем пустой объект файла
                BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(newFile));
                //и записываем в него байтики
                stream.write(fileBytes);
                //закрываем стрим
                stream.close();

                System.out.println("File is saved under: " + rootPath + File.separator + file.getOriginalFilename());
                //возвращаем @ResponseBody String
                return "File is saved under: " + rootPath + File.separator + file.getOriginalFilename();

            } catch (Exception e) {
                e.printStackTrace();
                return "File upload is failed: " + e.getMessage();
            }
        } else {
            return "File upload is failed: File is empty";
        }
    }
}
