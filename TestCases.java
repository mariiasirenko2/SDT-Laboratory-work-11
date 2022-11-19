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
       ResultSet rs3 =stmt.executeQuery("create or replace function check_reminder(reminder_name varchar, reminder_day varchar)\n"
            + "return number\n"
            + "is\n"
            + "    res number(1);\n"
            + "begin\n"
            + "    if check_reminder_name(reminder_name) then\n"
            + "        if check_reminder_day(reminder_day) then\n"
            + "        begin\n"
            + "            res:=1;\n"
            + "        exception when others then\n"
            + "            res := -3;\n"
            + "        end;\n"
            + "    else\n"
            + "        res :=-2;\n"
            + "    end if;\n"
            + "else\n"
            + "res :=-1;\n"
            + "end if;\n"
            + "return res;\n"
            + "end");
        con.close();
        }catch(Exception e){
          System.out.println(e);
        }
      }

   
}
