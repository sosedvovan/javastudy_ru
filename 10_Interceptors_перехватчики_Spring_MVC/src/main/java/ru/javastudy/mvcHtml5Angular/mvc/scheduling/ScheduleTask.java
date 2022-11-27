package ru.javastudy.mvcHtml5Angular.mvc.scheduling;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import java.util.Date;

/**
 * планировщик Schedule:
 * Класс задаем в качестве spring bean с помощью аннотации @Component.
 * Теперь над методами используем аннотацию @Scheduled с параметрами.
 * В данном случае в одном методе задается задержка в 10000 мс,
 * а во втором передается cron выражение. В результате методы будут выполнятся
 * каждые 10 и 30 секунд соответственно (после настройки в апликайшен-контексте).
 */
@Component
public class ScheduleTask {

    @Scheduled(fixedDelay = 10000)
    public void fixedDelaySchedule() {
        System.out.println("fixedDelaySchedule every 10 seconds" + new Date());
    }

    //every 30 seconds (seconds, minutes, hours, day of month, month, day of week, year(optional))
    @Scheduled(cron = "0/30 * * * * ?")
    public void cronSchedule() {
        System.out.println("cronSchedule every 30 seconds" + new Date());
    }

}
