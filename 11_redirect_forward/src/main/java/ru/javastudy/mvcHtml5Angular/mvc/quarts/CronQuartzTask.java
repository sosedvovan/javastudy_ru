package ru.javastudy.mvcHtml5Angular.mvc.quarts;

import java.util.Calendar;

/**
 * Как видите, оба класса ничего не реализуют, не расширяют и не помечены какой-либо
 * аннотацией. В них по одному методу с выводом в консоль простенькой информации.
 *
 * Чтобы выполнить эти методы нам понадобится добавить немного настроек в
 * конфигурацию Spring. В данном случае они были добавлены в application-context.xml.
 * look application-context.xml
 * 1. cronTrigger
 * 2. quartzCronJob
 * 3. bean id="cronQuartzTask"
 * 4. Quartz Scheduler
 */
public class CronQuartzTask {

    public void cronTaskMethod() {
        //you can send emails to users here
        System.out.println("Cron Time: " + Calendar.getInstance().getTime());
    }
}
