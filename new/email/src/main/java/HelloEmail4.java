import javax.mail.*;
import javax.mail.internet.InternetAddress;
import java.io.IOException;
import java.util.Properties;
import javax.mail.internet.MimeMultipart;
import org.jsoup.Jsoup;
//читаем емайл
public class HelloEmail4 {
    public static void main(String[] args) throws Exception {
        //Объект properties содержит параметры соединения
        Properties properties = new Properties();
        //Так как для чтения Yandex требует SSL-соединения - нужно использовать фабрику SSL-сокетов
        properties.setProperty("mail.imap.socketFactory.class", "javax.net.ssl.SSLSocketFactory");

        //Создаем соединение для чтения почтовых сообщений
        Session session = Session.getDefaultInstance(properties);
        //Это хранилище почтовых сообщений. По сути - это и есть почтовый ящик=)
        Store store = null;
        try {
            //Для чтения почтовых сообщений используем протокол IMAP.
            //Почему? Так Yandex сказал: https://yandex.ru/support/mail/mail-clients.html
            //см. раздел "Входящая почта"
            store = session.getStore("imap");
            //Подключаемся к почтовому ящику
            store.connect("imap.yandex.ru", 993, "drugst@yandex.ru", "Q12wQ12w_1978");
            //Это папка, которую будем читать
            Folder inbox = null;
            try {
                //Читаем папку "Входящие сообщения"
                inbox = store.getFolder("INBOX");
                //Будем только читать сообщение, не меняя их
                inbox.open(Folder.READ_ONLY);

                //Получаем количество сообщения в папке
                int count = inbox.getMessageCount();
                //Вытаскиваем все сообщения с первого по последний
                Message[] messages = inbox.getMessages(count-10, count);
                //Циклом пробегаемся по всем сообщениям
                for (Message message : messages) {
                    //От кого
                    String from = ((InternetAddress) message.getFrom()[0]).getAddress();
                    System.out.println("FROM: " + from);
                    //Тема письма
                    System.out.println("SUBJECT: " + message.getSubject());
//                    System.out.println("getFolder: " + message.getFolder());
                    //Содержание письма
                    System.out.println("Text: "+getTextFromMessage(message));
                    System.out.println("-------------------------------------------");

//                    System.out.println("getSentDate" + message.getSentDate());
//                    System.out.println("getContentType" + message.getContentType());
//                    System.out.println("getReceivedDate" + message.getReceivedDate());
//                    System.out.println("getContent" + message.getContent());
//                    System.out.println("getAllRecipients" + message.getAllRecipients());
                }
            } finally {
                if (inbox != null) {
                    //Не забываем закрыть собой папку сообщений.
                    inbox.close(false);
                }
            }

        } finally {
            if (store != null) {
                //И сам почтовый ящик тоже закрываем
                store.close();
            }
        }
    }

//метод из message берет содержимое емейла
//https://stackoverflow.com/questions/11240368/how-to-read-text-inside-body-of-mail-using-javax-mail
    private static String getTextFromMessage(Message message) throws Exception {
        if (message.isMimeType("text/plain")){
            return message.getContent().toString();
        }else if (message.isMimeType("multipart/*")) {
            String result = "";
            MimeMultipart mimeMultipart = (MimeMultipart)message.getContent();
            int count = mimeMultipart.getCount();
            for (int i = 0; i < count; i ++){
                BodyPart bodyPart = mimeMultipart.getBodyPart(i);
                if (bodyPart.isMimeType("text/plain")){
                    result = result + "\n" + bodyPart.getContent();
                    break;  //without break same text appears twice in my tests
                } else if (bodyPart.isMimeType("text/html")){
                    String html = (String) bodyPart.getContent();
                    result = result + "\n" + Jsoup.parse(html).text();

                }
            }
            return result;
        }
        return "";
    }
}
