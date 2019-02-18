import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.xuan.atcrowdfunding.bean.User;
import com.xuan.atcrowdfunding.manager.service.UserService;
import com.xuan.atcrowdfunding.util.MD5Util;

public class test01 {
	
	public static void main(String[] args) {
		ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext("spring/spring*.xml");
		
		UserService userService = context.getBean(UserService.class);
		
		for (int i = 0; i < 100; i++) {
			User user = new User();
			user.setLoginacct("zhang"+i);
			user.setUsername("张三"+i);
			user.setUserpswd(MD5Util.digest(123+"i"));
			user.setEmail("zhangsan"+i+"@163.com");
			user.setCreatetime("2019-07-08 12:11:11");
			userService.saveUser(user);
		}
		
	}

}
