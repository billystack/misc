require 'java' 
require "C:/jruby-1.6.5/lib/sqljdbc4.jar"


def connect_to_db()

	puts "About to connect..."
	
	ds = com.microsoft.sqlserver.jdbc.SQLServerDataSource.new();
	ds.setUser("BillyBloggs");
	ds.setPassword("password");
	ds.setServerName("localhost");
	ds.setPortNumber(1433); 
	ds.setDatabaseName("JRubyExample");
	$connection = ds.getConnection();
	
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

      id = resultset.get_int(1);

      forename = resultset.getString(2);
      surname = resultset.getString(3);

      print "\nId: ", id, " Forename: ", forename, " Surname: ", surname;
    end            
end

#windows auth

connect_to_db
displayAllDevelopers



