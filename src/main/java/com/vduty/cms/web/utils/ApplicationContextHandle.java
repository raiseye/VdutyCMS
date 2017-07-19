package com.vduty.cms.web.utils;

import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;

public class  ApplicationContextHandle implements ApplicationContextAware{ 
	 private static ApplicationContext applicationContext;  
     
	    @Override  
	    public void setApplicationContext(ApplicationContext applicationContext) throws BeansException {  
	        ApplicationContextHandle.applicationContext = applicationContext;  
	    }  
	  
	    /**  
	     * 获取对象  
	     * 这里重写了bean方法，起主要作用  
	     * @param <T>
	     * @param name  
	     * @return Object 一个以所给名字注册的bean的实例  
	     * @throws BeansException  
	     */    
	    public static <T> Object getBean(Class<T> name) throws BeansException {  
	        return applicationContext.getBean(name);
	    }  
}
