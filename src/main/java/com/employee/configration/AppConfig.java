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
        source.setDriverClassName("com.mysql.cj.jdbc.Driver");
        source.setUrl("jdbc:mysql://localhost:3306/EmployeeManagement?createDatabaseIfNotExist=true");
        source.setUsername("root");
        source.setPassword("kuldeep@123");
        return source;
    }

    private Properties getProperties(){
        Properties properties=new Properties();
        properties.setProperty("hibernate.dialect", "org.hibernate.dialect.MySQL8Dialect");
        properties.setProperty("hibernate.hbm2ddl.auto", "update");
        properties.setProperty("hibernate.show_sql", "true");
        return properties;
    }
}
