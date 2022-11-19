import java.sql.*;
import oracle.jdbc.driver.*;

class TestCases {

    public static void main(final String[] args) {
        try{
        DriverManager.registerDriver(new oracle.jdbc.driver.OracleDriver());
        Connection con = DriverManager.getConnection(
            "jdbc:oracle:thin:@91.219.60.189:1521/XEPDB1",
            args[0],
            args[1]);

        Statement stmt = con.createStatement();
        ResultSet rs0 = stmt.executeQuery("create table reminder(reminder_id number primary key,name varchar2(100),days varchar2(100))");
             ResultSet rs1 = stmt.executeQuery("insert into reminder values(1,'Breakfast','ПН')");
        ResultSet rs = stmt.executeQuery("select *from reminder");
       
        while(rs.next())
            System.out.println(rs.getInt(1));

        con.close();
        }catch(Exception e){
          System.out.println(e);
        }
    }
}
