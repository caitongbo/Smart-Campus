# smartcampus

演示地址：

   https://lab.caitongbo.com/smartcampus/
    
   | 类型 | 账号 | 密码 |
   |  :-: |  :-: |  :-: | 
   | 学生| s1 | s1 |
   | 学生| s2 | s2 |
   | 教师| t1 | t1 | 
   | 教师| t2 | t2 | 
   | 商家| b1 | b1 |
   | 商家| b2 | b2 |

预览操作：

![](https://github.com/caitongbo/smartcampus2/blob/master/src/main/webapp/images/login.png)
![](https://github.com/caitongbo/smartcampus2/blob/master/src/main/webapp/images/s1.png)
![](https://github.com/caitongbo/smartcampus2/blob/master/src/main/webapp/images/s2.png)
![](https://github.com/caitongbo/smartcampus2/blob/master/src/main/webapp/images/t1.png)
![](https://github.com/caitongbo/smartcampus2/blob/master/src/main/webapp/images/t2.png)
![](https://github.com/caitongbo/smartcampus2/blob/master/src/main/webapp/images/b1.png)
![](https://github.com/caitongbo/smartcampus2/blob/master/src/main/webapp/images/b2.png)
![](https://github.com/caitongbo/smartcampus2/blob/master/src/main/webapp/images/b3.png)

1.开发环境及工具

    jdk1.8 + mysql5.7 + tomcat7/8 + IDEA
    
2.系统架构

    Spring + Springmvc + Maven + Mybatis + BootStrap   
    
3.项目文件导入IDEA 
    
    方式一：
     
    已经安装github，可以直接Fork此仓库，打开Intellij IDEA-->File-->New-->Project from Version Control-->Git
    URL地址选择 https://github.com/你的github账户名/smartcampus.git 待所有架包下载导入完成即可
        
    方式二：
        
    下载仓库到本地并解压，打开Intellij IDEA-->Open（选择项目解压路径），找到porm.xml文件并打开，待所有架包下载导入完成即可     

4.sql文件导入MySQL数据库
  
   smartcampus.sql文件存放路径：
    
    resources/db 
  
    1.直接导入选择smartcampus.sql
     
    2.手动执行打开手动建库smartcampus.txt，复制语句执行     

5.修改JDBC及MyBatis数据库连接配置

    JDBC配置文件存放路径：
    
    resources/jdbc.properties
   
    MyBatis配置文件存放路径：
        
    resources/generatorConfig.properties

6.IDEA部署tomcat执行

   注意：另外针对windows平台，若tomcat安装在系统盘，例如C盘，可能会出现项目日志文件无法写入的情况，可以更改日志的存放路径到其他可写位置或者以管理员身份重新打开IDEA即可解决

    
    # smartcampus2
