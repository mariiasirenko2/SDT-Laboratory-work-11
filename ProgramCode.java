package com.nuop.sdt;

public class Reminder {

  private Long id,
  private String name;
  private String days,
  private Date time;
  
  public void setDayToReminder(String days){
    if(new String("ПН ВТ СР ЧТ ПТ СБ ВС").contains(days){
        this.day = days;
    }
    else throws IllegalArgumentException("Allowed days: ПН ВТ СР ЧТ ПТ СБ ВС ");
  
  }

  public static void main(String[] args) {
    Reminder reminder = new Reminder();
    reminder.setDayToReminder("СР");
  }
}
