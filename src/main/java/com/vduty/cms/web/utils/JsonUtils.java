package com.vduty.cms.web.utils;


        import java.lang.reflect.Type;
        import com.google.gson.Gson;
/**
 * Java对象和JSON字符串相互转化工具类
 * @date 2014-06-10
 */
public class JsonUtils {
    /**
     * 对象转换成json字符串
     * @param obj
     * @return
     */
    public static String toJsonStr(Object obj) {
        Gson gson = new Gson();

        return gson.toJson(obj);
    }

    /**
     * json字符串转成对象
     * @param str
     * @param type  {@code new TypeToken<List<Map<String,String>>>(){}.getType()}
     * @return
     */
    public static <T> T fromJson(String str, Type type) {
        Gson gson = new Gson();
        return gson.fromJson(str, type);
    }


    /**
     * json字符串转成对象
     * @param str  需要转换的字符串
     * @param type 需要转换的对象类型
     * @return 对象
     */
    public static <T> T fromJson(String str, Class<T> type) {
        Gson gson = new Gson();
        return gson.fromJson(str, type);
    }

}

