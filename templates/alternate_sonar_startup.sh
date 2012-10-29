java -Djava.awt.headless=true -XX:MaxPermSize=128m -server -Xmx512m -Xms256m -cp lib/*:extensions/jdbc-driver/derby/*:extensions/jdbc-driver/mssql/*:extensions/jdbc-driver/mysql/*:extensions/jdbc-driver/oracle/*:extensions/jdbc-driver/postgresql.*:. org.sonar.application.StartServer

