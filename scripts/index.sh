#!/bin/bash 
sudo ufw allow 8080
MANAGERFILE=/opt/bitnami/apache-tomcat/conf/Catalina/localhost/manager.xml
if test ! -e "$MANAGERFILE"; then
    touch $MANAGERFILE
    echo "<Context privileged=\"true\" antiResourceLocking=\"false\" docBase=\"\${catalina.home}/webapps/manager\">" > $MANAGERFILE
    echo "    <Valve className=\"org.apache.catalina.valves.RemoteAddrValve\" allow=\"^.*\$\" />" >> $MANAGERFILE
    echo "</Context>" >> $MANAGERFILE
fi
touch /opt/bitnami/apache-tomcat/webapps/petclinic/WEB-INF/web.xml 
