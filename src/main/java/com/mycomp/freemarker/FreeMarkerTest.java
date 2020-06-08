package com.mycomp.freemarker;

import com.mycomp.freemarker.pojo.User;
import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateException;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.*;

public class FreeMarkerTest {
    public static void main(String[] args) throws IOException, TemplateException {
        // 第一步: 创建一个Configuration对象, 直接new一个对象, 构造方法的参数就是FreeMarker的版本号
        Configuration configuration = new Configuration(Configuration.getVersion());

        // 第二步: 设置模板文件所在文件夹的路径
        configuration.setDirectoryForTemplateLoading(new File("H:\\IDEA_workspace\\Learn_FreeMarker\\src\\main\\resources\\ftl"));

        // 第三步: 设置模板文件使用的字符集, 一般就是utf-8
        configuration.setDefaultEncoding("utf-8");

        // 第四步: 加载一个模板, 创建一个模板对象
        Template template = configuration.getTemplate("template_test.ftl");

        // 第五步: 创建一个模板使用的数据集, 可以是pojo也可以是map, 一般是map
        Map<String, Object> templateData = new HashMap<>();
        templateData.put("name", "zzq");
        templateData.put("message", "请继续挣命");
        templateData.put("today", new Date());

        List<String> goodsList = new ArrayList<>();
        goodsList.add("goods1");
        goodsList.add("goods2");
        goodsList.add("goods3");
        templateData.put("goodsList", goodsList);

        List<User> userList = new ArrayList<>();
        userList.add(new User("username1", "password1"));
        userList.add(new User("username2", "password2"));
        userList.add(new User("username3", "password3"));
        templateData.put("userList", userList);

        // 第六步: 创建一个Writer对象, 一般是FileWriter对象, 指定生成的文件名
        FileWriter fileWriter = new FileWriter(new File("H:\\IDEA_workspace\\Learn_FreeMarker\\src\\main\\resources\\html\\template_test.html"));

        // 第七步: 调用模板对象的process()方法输出文件
        template.process(templateData, fileWriter);

        // 第八步: 关闭流
        fileWriter.close();
    }
}
