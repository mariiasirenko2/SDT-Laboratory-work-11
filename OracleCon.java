package com.nuop.sdt;

import oracle.jdbc.driver.*;

class OracleCon {
    public static void main (final String[] args){
      try{
        DriverManager.registerDriver(new oracle.jdbc.driver.OracleDriver());
        Connection con = DriverManager.getConnection(
            "jdbc:oracle:thin:@91.219.60.189:1521/XEPDB1",
            args[0],
            args[1]);

        Statement stmt = con.createStatement();
        ResultSet rs = stmt.executeQuery("create table reminder(reminder_id int primary key, name varchar, days varchar);");
        ResultSet rs1 =stmt.executeQuery("insert into reminder values(1,'Breakfast','ПН');");
        ResultSet rs3 =stmt.executeQuery("select *from reminder;");
        while (rs.next()) 
          System.out.println(rs3.getInt(1) + " " + rs3.getString(2)," ", rs3.getString(3));

        con.close();
        }catch(Exception e){
          System.out.println(e);
        }
      }

    }
  }
