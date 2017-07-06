package com.vduty.cms.web.utils;

import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

import org.apache.log4j.Logger;
import org.springframework.beans.BeansException;
import org.springframework.beans.factory.config.ConfigurableListableBeanFactory;
import org.springframework.beans.factory.config.PropertyPlaceholderConfigurer;

public class PropertyUtils extends PropertyPlaceholderConfigurer{
	
	public static final Logger logger = Logger.getLogger(PropertyUtils.class);
	
	private static Map<String, String> propertyMap;

	@Override
	protected void processProperties(
			ConfigurableListableBeanFactory beanFactoryToProcess,
			Properties props) throws BeansException {
		super.processProperties(beanFactoryToProcess, props);
		propertyMap = new HashMap<String, String>();
		for (Object key : props.entrySet()){
			String keyStr = key.toString();
			String value = props.getProperty(keyStr);
			propertyMap.put(keyStr, value);
		}
	}
	
	public static String getValue(String key){
		if (null != propertyMap){
			String value = propertyMap.get(key);
			return value;
		}
		return "";
	}
	
	public static String getRoot(){
		String rootKey = "iceng.app.store.root";
		String appstoreRoot = System.getProperty(rootKey);
		Enumeration<?> enu = System.getProperties().propertyNames();
		while (enu.hasMoreElements()) {
			Object key = enu.nextElement();
			if (key.toString().startsWith(rootKey)) {
				appstoreRoot = System.getProperty(key.toString());
				break;
			}
		}
		logger.info(appstoreRoot);
		return appstoreRoot;
	}
	
	
	

}
