package com.niit.myproject;
import java.util.Properties;

import javax.sql.DataSource;

import org.hibernate.SessionFactory;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.orm.hibernate5.HibernateTransactionManager;
import org.springframework.orm.hibernate5.LocalSessionFactoryBuilder;
import org.springframework.transaction.annotation.EnableTransactionManagement;
 
@Configuration
@EnableTransactionManagement
@ComponentScan({ "com.niit.myproject" })

public class HibernateConfiguration {
	private final static String JDBC_URL = "jdbc:h2:tcp://localhost/~/itsmeimran";
	private final static String JDBC_DRIVER_CLASS = "org.h2.Driver";		
	private final static String JDBC_USERNAME = "sa";
	private final static String JDBC_PASSWORD = "";
	

    @Bean
    public SessionFactory sessionFactory(DataSource dataSource) {
        LocalSessionFactoryBuilder builder = new LocalSessionFactoryBuilder(dataSource);	        
        builder.addProperties(hibernateProperties());
        builder.scanPackages("com.niit.myproject");
        return builder.buildSessionFactory();
     }
     
    @Bean
    public DataSource dataSource() {
        DriverManagerDataSource dataSource = new DriverManagerDataSource();
        dataSource.setDriverClassName(JDBC_DRIVER_CLASS);
        dataSource.setUrl(JDBC_URL);
        dataSource.setUsername(JDBC_USERNAME);	        
        dataSource.setPassword(JDBC_PASSWORD);
        return dataSource;
    }
     
    private Properties hibernateProperties() {
        Properties properties = new Properties();
        properties.put("hibernate.dialect", "org.hibernate.dialect.H2Dialect"); 
        properties.put("hibernate.show_sql", "true");
        properties.put("hibernate.format_sql", "true");
        properties.put("hibernate.hbm2ddl.auto", "update");
        return properties;        
    }
     
    @Bean
    public HibernateTransactionManager transactionManager(SessionFactory sessionFactory) {
       HibernateTransactionManager txManager = new HibernateTransactionManager();
       txManager.setSessionFactory(sessionFactory);
       return txManager;
    }
}

