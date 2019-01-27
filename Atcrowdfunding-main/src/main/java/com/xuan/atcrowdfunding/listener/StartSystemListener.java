package com.xuan.atcrowdfunding.listener;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

public class StartSystemListener implements ServletContextListener{

	public void contextInitialized(ServletContextEvent sce) {
		ServletContext context = sce.getServletContext();
		String path = context.getContextPath();
		System.out.println(path);
		context.setAttribute("APP_PATH", path);
	}

	public void contextDestroyed(ServletContextEvent sce) {
		
	}

}
