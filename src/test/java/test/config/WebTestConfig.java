package test.config;


import javax.annotation.Resource;
import javax.sql.DataSource;

import org.junit.Before;
import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.jdbc.datasource.init.DatabasePopulatorUtils;
import org.springframework.jdbc.datasource.init.ResourceDatabasePopulator;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= 
{"classpath:member/manage/config/scan/root-context.xml",
"classpath:member/manage/config/scan/application-context.xml",
"classpath:member/manage/config/db/datasource-context_dev.xml"})
@WebAppConfiguration
public class WebTestConfig {
	@Resource(name="dataSource")
	private DataSource dataSource;
	
		@Autowired // 타입으로 적절한 spring Bean을 찾는 것이다.
		private WebApplicationContext context;
		
		public static MockMvc mockMvc;	// dispatcherServlet 역할을 하는 객체
		
		
		@Before
		public void setup() {
			mockMvc = MockMvcBuilders.webAppContextSetup(context).build();
			
			ResourceDatabasePopulator populator = 
					new ResourceDatabasePopulator();

			populator.addScripts(new ClassPathResource("/member/manage/config/db/initData_dev.sql")); // 설정 파일을 추가한다.
			populator.setContinueOnError(false);	// 스크립트 실행중 에러 발생시 멈춤 ..
			
			DatabasePopulatorUtils.execute(populator, dataSource);
			
			
		}
	@Ignore
	@Test
	public void test() {
		
	}
}
