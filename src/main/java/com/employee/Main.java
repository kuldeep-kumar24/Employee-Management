package com.employee;
import org.apache.catalina.startup.Tomcat;

import java.io.File;

public class Main {
    public static void main(String[] args) throws Exception {
        Tomcat tomcat = new Tomcat();
        tomcat.setPort(Integer.parseInt(System.getenv().getOrDefault("PORT", "8080")));
        tomcat.getHost().setAppBase(".");
        File webappDir = new File("webapp");
        if (!webappDir.exists()) {
            webappDir = new File("target/classes/webapp");
        }
        tomcat.addWebapp("/", webappDir.getAbsolutePath());
        System.out.println("Starting embedded Tomcat...");
        tomcat.start();
        tomcat.getServer().await();
    }
}
