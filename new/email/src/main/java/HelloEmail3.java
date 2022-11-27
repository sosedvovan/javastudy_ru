import javax.activation.DataHandler;
import javax.activation.FileDataSource;
import javax.mail.*;
import javax.mail.internet.*;
import java.io.File;
import java.io.UnsupportedEncodingException;
import java.util.Properties;
//Наводим красоту (слово привет на желтом фоне)
//https://toolkas.blogspot.com/2019/02/java.html

public class HelloEmail3 {
    public static void main(String[] args) throws MessagingException, UnsupportedEncodingException {
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
//        message.setText("Hello, Email!");
        //Файл вложения
        File file = new File("D:/1.txt");


//Собираем содержимое письма из кусочков
        MimeMultipart multipart = new MimeMultipart();


//Первый кусочек - текст письма
        MimeBodyPart part1 = new MimeBodyPart();
        part1.addHeader("Content-Type", "text/html; charset=UTF-8");
        part1.setDataHandler(
                new DataHandler(
                        "<html><body style=\"background-color: #FFFF00;color: #FF0033;\"><h1>Привет!</h1></body></html>",
                        "text/html; charset=\"utf-8\""
                )
        );
        multipart.addBodyPart(part1);

//Второй кусочек - файл
        MimeBodyPart part2 = new MimeBodyPart();
        part2.setFileName(MimeUtility.encodeWord(file.getName()));
        part2.setDataHandler(new DataHandler(new FileDataSource(file)));
        multipart.addBodyPart(part2);
//Добавляем оба кусочка в сообщение
        message.setContent(multipart);
        //Поехали!!!
        Transport.send(message);
    }
}

