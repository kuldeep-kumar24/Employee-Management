package com.employee;
import org.apache.catalina.startup.Tomcat;

public class App {
    public static void main(String[] args) throws Exception {
        Tomcat tomcat = new Tomcat();
        tomcat.setPort(Integer.parseInt(System.getenv().getOrDefault("PORT", "8080")));
        tomcat.getHost().setAppBase(".");
        tomcat.addWebapp("/", "src/main/webapp/");
        System.out.println("Starting embedded Tomcat...");
        tomcat.start();
        tomcat.getServer().await();
    }
}
