package com.nuop.sdt;
import java.util.Date;

public class Reminder {

  public Long id,
  public String name;
  public String days,
  public Date time;
  
  public void setDayToReminder(String days){
    if(new String("ПН ВТ СР ЧТ ПТ СБ ВС").contains(days){
        this.day = days;
    }
    else System.out.println("Allowed days: ПН ВТ СР ЧТ ПТ СБ ВС ");
  
  }

  public static void main(String[] args) {
    Reminder reminder = new Reminder();
    reminder.setDayToReminder("СР");
  }
}
