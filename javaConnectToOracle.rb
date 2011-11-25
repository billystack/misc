require 'java' 
require "C:/jruby-1.6.5/lib/ojdbc14.jar"



def connect_to_db()

   odriver = Java::JavaClass.for_name("oracle.jdbc.driver.OracleDriver") 
   url = "jdbc:oracle:thin:@localhost:1521:XE" 
   puts "About to connect..." 

   $connection = java.sql.DriverManager.getConnection(url, "SYSTEM", "password"); 
   
   if $connection
      puts "Connected successfully" 
   else 
      puts "Connection failed" 
   end
end


def displayAllDevelopers()

   statement = $connection.createStatement();
     
   sql = "SELECT * FROM Developers";

   resultset = statement.executeQuery(sql);

   while resultset.next()

      #id = resultset.getInt(1);
      id = resultset.get_int(1);

      forename = resultset.getString(2);
      surname = resultset.getString(3);

      print "\nId: ", id, " Forename: ", forename, " Surname: ", surname;
    end            
end



connect_to_db
displayAllDevelopers



