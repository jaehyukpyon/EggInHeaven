package com;

import javax.sql.DataSource;

import org.apache.commons.dbcp.BasicDataSource;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@Configuration
@EnableTransactionManagement // annotation 기반 트랜잭션 관리를 사용. <tx:annotation-driven />
@MapperScan(basePackages = {"com.naver.myhome4.mybatis.mapper"}) // mapper 인터페이스가 있는 패키지 경로를 지정.
public class MyBatisConfig {

	@Bean(destroyMethod = "close")
	public DataSource dataSource() {
		
		BasicDataSource dataSource = new BasicDataSource();

		dataSource.setDriverClassName("oracle.jdbc.driver.OracleDriver");
		dataSource.setUrl("jdbc:oracle:thin:@localhost:1521:xe");

		dataSource.setUsername("egg");
		dataSource.setPassword("1234");

		return dataSource;
	}
	
	@Bean
	public SqlSessionFactory sqlSessionFactoryBean(DataSource dataSource) throws Exception {
		
		SqlSessionFactoryBean factoryBean = new SqlSessionFactoryBean();
		
		factoryBean.setDataSource(dataSource);
		
		factoryBean.setConfigLocation(new PathMatchingResourcePatternResolver().getResource("/com/naver/myhome4/mybatis/config/mybatis-config.xml"));
		
		factoryBean.setTypeAliasesPackage("com.naver.myhome4.domain");
		
		return factoryBean.getObject();
	}
	
	@Bean
	public SqlSessionTemplate sqlSessionTemplate(SqlSessionFactory sqlSessionFactory) {
		return new SqlSessionTemplate(sqlSessionFactory);
	}
	
	// 트랜잭션 매니저 등록
	@Bean
	public DataSourceTransactionManager transactionManager() {
		return new DataSourceTransactionManager(dataSource());
	}	
	
}
