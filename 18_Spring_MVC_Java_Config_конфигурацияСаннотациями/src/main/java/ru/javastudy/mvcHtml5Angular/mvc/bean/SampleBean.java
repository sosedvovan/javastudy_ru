package ru.javastudy.mvcHtml5Angular.mvc.bean;

import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;

/**
 * SampleBean — просто spring-бин c двумя полями,
 * которые инициализируются при инициализации бина
 * Создали этот класс чтобы протестировать создание бина этого класса
 */
@Component(value = "sampleBean")
public class SampleBean {

    private String stringValue;
    private int number;

    public SampleBean() {
    }

    @PostConstruct
    public void init() {
        stringValue = "postConstructValue";
        number = 666;
    }

    public String getStringValue() {
        return stringValue;
    }

    public void setStringValue(String stringValue) {
        this.stringValue = stringValue;
    }

    public int getNumber() {
        return number;
    }

    public void setNumber(int number) {
        this.number = number;
    }
}
