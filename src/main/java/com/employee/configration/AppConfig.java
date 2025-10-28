package com.employee.configration;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

import java.util.Properties;

@Configuration
@ComponentScan(basePackages = "com.employee")
public class AppConfig {

    @Bean
    InternalResourceViewResolver viewResolver(){
        InternalResourceViewResolver resolver=new InternalResourceViewResolver();
        resolver.setPrefix("/WEB-INF/template/");
        resolver.setSuffix(".jsp");
        return resolver;
    }

    @Bean
    LocalSessionFactoryBean sessionFactoryBean(){
        LocalSessionFactoryBean sessionFactory=new LocalSessionFactoryBean();
        sessionFactory.setDataSource(getSource());
        sessionFactory.setHibernateProperties(getProperties());
        sessionFactory.setPackagesToScan("com.employee.model");
        return sessionFactory;
    }

    private DriverManagerDataSource getSource(){
        DriverManagerDataSource source=new DriverManagerDataSource();
        source.setDriverClassName("org.postgresql.Driver");
        source.setUrl("postgresql://kuldeep:yTT9Dj8ZW5rI3ORhkAXKxTB7je6MyIwg@dpg-d4061k7diees73ajun2g-a.oregon-postgres.render.com/employeemanagement_cbno");
        source.setUsername("kuldeep");
        source.setPassword("yTT9Dj8ZW5rI3ORhkAXKxTB7je6MyIwg");
        return source;
    }

    private Properties getProperties() {
        Properties properties = new Properties();
        properties.setProperty("hibernate.dialect", "org.hibernate.dialect.PostgreSQLDialect");
        properties.setProperty("hibernate.hbm2ddl.auto", "update");
        properties.setProperty("hibernate.show_sql", "true");
        return properties;
    }
}