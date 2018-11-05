package com.love.silin.config;

import com.alibaba.druid.spring.boot.autoconfigure.DruidDataSourceBuilder;
import com.love.silin.base.MybatisBaseDAOImpl;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.mapper.MapperScannerConfigurer;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;
import org.springframework.core.io.support.ResourcePatternResolver;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Repository;

import javax.sql.DataSource;
import java.util.Properties;


@Primary
@Configuration
public class DruidConfiguration {


    @Bean
    @ConfigurationProperties("spring.datasource.druid")
    public DataSource druidDataSource() {
        return DruidDataSourceBuilder.create().build();
    }

    @Bean
    public SqlSessionFactory userSqlSessionFactory(@Qualifier("druidDataSource") DataSource dataSource) {
        SqlSessionFactoryBean bean = new SqlSessionFactoryBean();
        bean.setDataSource(dataSource);

        try {
            ResourcePatternResolver resolver = new PathMatchingResourcePatternResolver();
            bean.setConfigLocation(resolver.getResource("classpath:mybatis/mappers-config.xml"));
            bean.setMapperLocations(resolver.getResources("classpath:mybatis/mapper/*.xml"));
            return bean.getObject();
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
    }

    /**
     * <B>Description:</B> 定义事务 <br>
     * <B>Create on:</B> 2018/4/15 上午10:27 <br>
     *
     * @author xiangyu.ye
     */
    @Bean
    public DataSourceTransactionManager userTransactionManager(@Qualifier("druidDataSource") DataSource dataSource) {
        return new DataSourceTransactionManager(dataSource);
    }

    /**
     * <B>Description:</B> 配置SqlSessionTemplate <br>
     * <B>Create on:</B> 2018/4/15 上午11:05 <br>
     *
     * @author xiangyu.ye
     */
    @Bean
    public SqlSessionTemplate userSqlSessionTemplate(@Qualifier("userSqlSessionFactory") SqlSessionFactory sqlSessionFactory) {
        return new SqlSessionTemplate(sqlSessionFactory);
    }

    @Bean
    public MybatisBaseDAOImpl userMybatisTemplate(@Qualifier("userSqlSessionTemplate") SqlSessionTemplate sqlSessionTemplate) {
        MybatisBaseDAOImpl bean = new MybatisBaseDAOImpl();
        bean.setSqlSessionTemplate(sqlSessionTemplate);
        return bean;
    }

    /**
     * <B>Description:</B> 配置MapperScannerConfigurer <br>
     * <B>Create on:</B> 2018/4/15 上午11:05 <br>
     *
     * @author xiangyu.ye
     */
    @Bean
    public MapperScannerConfigurer userMapperScannerConfigurer() {
        MapperScannerConfigurer configurer = new MapperScannerConfigurer();
        configurer.setBasePackage("com.love.silin.dao.*.*DAO");
        configurer.setAnnotationClass(Repository.class);
        configurer.setSqlSessionFactoryBeanName("userSqlSessionFactory");
        Properties properties = new Properties();

        return configurer;
    }

}