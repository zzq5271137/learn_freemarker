<html>
<head>
    <meta charset="utf-8">
    <title>FreeMarker Demo</title>
</head>
<body>

<#-- 注释内容  -->
<h3>
    ${name}，你好，${message}。
</h3>

<hr>

<#-- assign指令: 定义变量 -->
<#assign myName="ZzqGo">
<h3>${myName}</h3>
<hr>
<#assign person={"name":"ZzqGo", "age":"100"}>
<h3>姓名：${person.name}，年龄：${person.age}</h3>

<hr>

<#-- list指令: 遍历 -->
<#list goodsList as goods>
    <h3>${goods_index}: ${goods}</h3>
</#list>
<hr>
<#list userList as user>
    <h3>用户名：${user.username}，密码：${user.password}</h3>
</#list>

<hr>

<#-- if指令: 判断 -->
<#assign res="123">
<#if res="123">
    <h3>结果为123</h3>
<#elseif res="1234">
    <h3>结果为1234</h3>
<#else>
    <h3>结果未知</h3>
</#if>

<hr>

<#-- include指令: 引入模板 -->
<#include "content.ftl">

<hr>

<#-- 内建函数语法: 变量名 + ? + 函数名 -->
<#-- size: 获取集合大小 -->
<h3>goodsList共${goodsList?size}个元素</h3>
<hr>
<#-- eval: 将json字符串转成对象 -->
<#assign jsonStr="{'name':'zzq','age':'100'}">
<#assign jsonObj=jsonStr?eval>
<h3>名字：${jsonObj.name}，年龄：${jsonObj.age}</h3>
<hr>
<#-- datetime、date、time、string(): 日期格式化 -->
<h3>当前日期时间：${today?datetime}</h3>
<h3>当前日期：${today?date}</h3>
<h3>当前时间：${today?time}</h3>
<h3>自定义日期格式：${today?string("yyyy年MM月dd日")}</h3>
<hr>
<#-- c: 数字类型转成字符串 -->
<#assign price=199900>
<h3>数字类型，处理前：${price}</h3>
<h3>数字类型，转成字符串后：${price?c}</h3>
<hr>
<#-- ?: 判断变量是否为空 -->
<#if price??>
    <h3>price存在</h3>
<#else>
    <h3>price不存在</h3>
</#if>
<#if priceNew??>
    <h3>priceNew存在</h3>
<#else>
    <h3>priceNew不存在</h3>
</#if>
<hr>
<#-- !: 缺省值 -->
<h3>${priceNew!"priceNew为空的默认值"}</h3>

</body>
</html>
