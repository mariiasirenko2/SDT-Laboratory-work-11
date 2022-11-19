import java.sql.*;
import oracle.jdbc.driver.*;

class TestCases {

    public static void main(final String[] args) {
        int testcaseResult = 0;
        try{
        DriverManager.registerDriver(new oracle.jdbc.driver.OracleDriver());
        Connection con = DriverManager.getConnection(
            "jdbc:oracle:thin:@91.219.60.189:1521/XEPDB1",
            args[0],
            args[1]);

         Statement stmt = con.createStatement();
       ResultSet rs3 =stmt.executeQuery("create or replace function check_reminder_day(reminder_day varchar)\n"
            + "return boolean\n"
            + "is\n"
            + "begin\n"
            + "return  regexp_like(reminder_day, '^(\\s*ПН|ВТ|СР)');\n"
            + "end");
        con.close();
        }catch(Exception e){
          System.out.println(e);
        }
      }

   
}
