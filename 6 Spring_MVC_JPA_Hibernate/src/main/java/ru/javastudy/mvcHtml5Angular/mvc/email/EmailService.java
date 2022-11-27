package ru.javastudy.mvcHtml5Angular.mvc.email;

import org.apache.velocity.app.VelocityEngine;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Service;
import org.springframework.ui.velocity.VelocityEngineUtils;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.concurrent.ExecutorService;

/**
 * В проекте используются три класса.
 * Контроллер, который перехватывает запросы,
 * модель для работы с почтой
 * и сервисный класс.
 * С помощью последнего мы будем создавать шаблон письма и
 * отправлять его пользователю.
 *
 *
 * Для получения писем, и их прочтения смотри пример в папке new/email
 */

/**
 * Наиболее важный класс для темы статьи. Вначале создаются константы, которые
 * требуются для задания характеристик почты (от кого, кому, тема, тело письма).
 * Переменных там может быть много и за подробностями обратитесь к Apache.
 * С помощью метода sendMail создается само письмо на основании переданной в качестве
 * аргумента модели (Map model).
 * Обратите внимание на создание переменной message и как туда передается параметр
 * для кодировки. Если этого не сделать, то с русскими символами нормально работать
 * будет затруднительно.
 * String text = VelocityEngineUtils.mergeTemplateIntoString(
 *                             velocityEngine, templateName, "UTF-8", model);
 * В этой строчке мы создаем само письмо на основании бина velocityEngine
 * (см. настройки application-context.xml, используется через автосвязывание в этом
 * классе), шаблона (registered.vm — будет показан чуть ниже), а так же кодировки и
 * модели письма. Далее с помощью внедренного автосвязыванием объекта
 * (бин mailSender из настроек application-context.xml) мы отправляем письмо
 * адресату вызывав mailSender.send() с переданным объектом из только что описанного
 * метода prepare() анонимного класса.
 */
@Service
public class EmailService {

    /*Email From*/
    public static final String FROM = "from";
    /*Email To*/
    public static final String TO = "to";
    /*Email Subject*/
    public static final String SUBJECT = "subject";
    /*Email BCC*/
    public static final String BCC_LIST = "bccList";
    /*Email CCC*/
    public static final String CCC_LIST = "ccList";

    @Autowired
    private JavaMailSender mailSender; //see application-context.xml

    @Autowired
    private VelocityEngine velocityEngine; //see application-context.xml


    public boolean sendEmail (final String templateName, final Map<String, Object> model) {
        boolean res = false;
        try {
            MimeMessagePreparator preparator = new MimeMessagePreparator() {

                @Override
                public void prepare(MimeMessage mimeMessage) throws Exception {
                    String from = (String) model.get(FROM);
                    String to = (String) model.get(TO);
                    String subject = (String) model.get(SUBJECT);

                    List<String> bccList = (List<String>) model.get(BCC_LIST);
                    //ВАЖНО! ПОСТАВЬТЕ КОДИРОВКУ UTF-8 ИЛИ СООБЩЕНИЯ БУДУТ ?????? ??
                    MimeMessageHelper message = new MimeMessageHelper(mimeMessage, "UTF-8"); //ENCODING IMPORTANT!
                    message.setFrom(from);
                    message.setTo(to);
                    message.setSubject(subject);
                    message.setSentDate(new Date());
                    if (bccList != null) {
                        for (String bcc : bccList) {
                            message.addBcc(bcc);
                        }
                    }

                    model.put("noArgs", new Object());
                    String text = VelocityEngineUtils.mergeTemplateIntoString(
                            velocityEngine, templateName, "UTF-8", model);

                    message.setText(text,true);
                }
            };

            mailSender.send(preparator);
            res = true;

        } catch (Exception ex) {
            ex.printStackTrace();
        }

        return res;
    }

    public boolean mySendEmail(Map<String, Object> model) {
        boolean res = false;
        try {
            Properties properties = new Properties();
            //Хост или IP-адрес почтового сервера
            properties.put("mail.smtp.host", "smtp.mail.ru");
            //Требуется ли аутентификация для отправки сообщения
            properties.put("mail.smtp.auth", "true");
            //Порт для установки соединения
            properties.put("mail.smtp.socketFactory.port", "465");
            //Фабрика сокетов, так как при отправке сообщения Yandex требует SSL-соединения
            properties.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");

            //Создаем соединение для отправки почтового сообщения
            Session session = Session.getDefaultInstance(properties,
                    //Аутентификатор - объект, который передает логин и пароль
                    new Authenticator() {
                        @Override
                        protected PasswordAuthentication getPasswordAuthentication() {
                            return new PasswordAuthentication("sosedvovan@list.ru", "jt79r86phSqQfdBDVUaK");
                        }
                    });


            //Создаем новое почтовое сообщение
            Message message = new MimeMessage(session);
            //От кого
            message.setFrom(new InternetAddress((String)model.get(FROM)));
            //Кому
            message.setRecipient(Message.RecipientType.TO, new InternetAddress((String)model.get(TO)));
            //Тема письма
            message.setSubject((String)model.get(SUBJECT));
            //Текст письма
            message.setText((String)model.get("message"));
            //Поехали!!!
            Transport.send(message);


            res = true;
        }catch (Exception ex) {
            ex.printStackTrace();
        }
        return res;
    }


}
