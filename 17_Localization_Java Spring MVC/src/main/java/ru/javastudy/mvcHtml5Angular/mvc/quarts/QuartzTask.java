package ru.javastudy.mvcHtml5Angular.mvc.quarts;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.Calendar;
/**
 * Quartz Task
 * Теперь рассмотрим как планировать и выполнять задачи с помощью библиотеки
 * Quartz Scheduler. Мы будем рассматривать два способа планирования задач:
 * 1й по простому триггеру с временной задержкой,
 * 2й — с помощью выражения cron аналогично примеру с аннотациями.
 * look application-context.xml
 * 1. simpleTrigger
 * 2. simpleQuartzJob
 * 3. bean id="simpleQuartzTask"
 * 4. Quartz Scheduler
 */
public class QuartzTask {

    private static final Logger logger = LoggerFactory.getLogger(QuartzTask.class);

    public void simpleTaskMethod() {
//		you can log here to database with simpletrigger
        logger.info("Test Simple Quartz Time: " + Calendar.getInstance().getTime());
        System.out.println("Test Simple Quartz Time: " + Calendar.getInstance().getTime());
    }

}
