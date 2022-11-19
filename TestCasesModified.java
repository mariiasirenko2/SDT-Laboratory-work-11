import java.sql.*;
import oracle.jdbc.driver.*;

class TestCasesModified {

     public static void main(final String[] args) {
        int testcaseResult = -1;
        try{
        DriverManager.registerDriver(new oracle.jdbc.driver.OracleDriver());
        Connection con = DriverManager.getConnection(
            "jdbc:oracle:thin:@91.219.60.189:1521/XEPDB1",
            args[0],
            args[1]);

              Statement stmt = con.createStatement();


        }catch(Exception e){
          System.out.println(e);
        }
          System.exit(testcaseResult);
      }
}
