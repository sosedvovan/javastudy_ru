import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Properties;
//отправляем только текст
//https://toolkas.blogspot.com/2019/02/java.html
public class HelloEmail {
    public static void main(String[] args) throws MessagingException {
        //Объект properties хранит параметры соединения.
        //Для каждого почтового сервера они разные.
        //Если не знаете нужные - обратитесь к администратору почтового сервера.
        //Ну или гуглите;=)
        //Конкретно для Yandex параметры соединения можно подсмотреть тут:
        //https://yandex.ru/support/mail/mail-clients.html (раздел "Исходящая почта")
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
        message.setFrom(new InternetAddress("sosedvovan@list.ru"));
        //Кому
        message.setRecipient(Message.RecipientType.TO, new InternetAddress("drugst@yandex.ru"));
        //Тема письма
        message.setSubject("Очень важное письмо!!!");
        //Текст письма
        message.setText("Hello, Email!");
        //Поехали!!!
        Transport.send(message);
    }
}
