# Step 1: Use a Tomcat base image
FROM tomcat:10.1-jdk17

# Step 2: Remove default webapps
RUN rm -rf /usr/local/tomcat/webapps/*

# Step 3: Copy your WAR to the Tomcat webapps directory
COPY target/Employee_Managment-1.0-SNAPSHOT.war /usr/local/tomcat/webapps/ROOT.war

# Step 4: Expose port 8080
EXPOSE 8080

# Step 5: Start Tomcat
CMD ["catalina.sh", "run"]
