
#git reset --hard
#git pull origin master
cp ./src/main/resources/data-source-cfg.xml.test ./src/main/resources/data-source-cfg.xml
cp ./src/main/webapp/WEB-INF/data-source-cfg.xml.test ./src/main/webapp/WEB-INF/data-source-cfg.xml
~/software/maven/apache-maven-3.6.3/bin/mvn clean install
#cp /Users/pradeeprao/.m2/repository/com/hms/HMS/1.0/HMS-1.0.war ~/software/apache-tomcat-9.0.30/webapps/HMS.war

