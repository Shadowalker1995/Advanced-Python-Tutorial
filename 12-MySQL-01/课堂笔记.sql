-- 数据库的操作

    -- 链接数据库
    mysql -uroot -p
    mysql -uroot -pmysql

    -- 退出数据库
    exit/quit/ctrl+d
    

    -- sql语句最后需要有分号;结尾
    -- 显示数据库版本
    select version();

    -- 显示时间
    select now();

    -- 查看所有数据库
    show databases;
    

    -- 创建数据库
    -- create database 数据库名 charset=utf8;
    create database python04;
    create database python04new charset=utf8;


    -- 查看创建数据库的语句
    -- show crate database ....
    show create database python04;
    

    -- 查看当前使用的数据库
    select database();

    -- 使用数据库
    -- use 数据库的名字
    use python04new;

    -- 删除数据库
    -- drop database 数据库名;
    drop database python04;


-- 数据表的操作

    -- 查看当前数据库中所有表
    show tables;
    

    -- 创建表
    -- auto_increment表示自动增长
    -- not null 表示不能为空
    -- primary key 表示主键
    -- default 默认值
    -- create table 数据表名字 (字段 类型 约束[, 字段 类型 约束]);
    create table xxxxx(id int, name varchar(30));
    create table yyyyy(id int primary key not null auto_increment, name varchar(30));
    create table zzzzz(
        id int primary key not null auto_increment,
        name varchar(30)
    );

    -- 查看表结构
    -- desc 数据表的名字;
    desc xxxxx;

    -- 创建students表(id、name、age、high、gender、cls_id)
    create table students(
        id int unsigned not null auto_increment primary key,
        name varchar(30),
        age tinyint unsigned default 0,
        high decimal(5,2),
        gender enum("男", "女", "中性", "保密") default "保密",
        cls_id int unsigned
    );

    insert into students values(0, "老王", 18, 188.88, "男", 0);
    select * from students;

    -- 创建classes表(id、name)
    create table classes(
        id int unsigned not null auto_increment primary key,
        name varchar(30)
    );

    insert into classes values(0, "python04大神");
    select * from classes;

    -- 查看表的创建语句
    -- show create table 表名字;
    show create table students;


    -- 修改表-添加字段
    -- alter table 表名 add 列名 类型;
    alter table students add birthday datetime;
    

    -- 修改表-修改字段：不重命名版
    -- alter table 表名 modify 列名 类型及约束;
    alter table students modify birthday date;


    -- 修改表-修改字段：重命名版
    -- alter table 表名 change 原名 新名 类型及约束;
    alter table students change birthday birth date default "2000-01-01";


    -- 修改表-删除字段
    -- alter table 表名 drop 列名;
    alter table students drop high;


    -- 删除表
    -- drop table 表名;
    -- drop database 数据库;
    -- drop table 数据表;
    drop table xxxxx;

    
-- 增删改查(curd)

    -- 增加
        -- 全列插入
        -- insert [into] 表名 values(...)
        -- 主键字段 可以用 0  null   default 来占位
        -- 向classes表中插入 一个班级
        insert into classes values(0, "菜鸟班");


        +--------+-------------------------------------+------+-----+------------+----------------+
        | Field  | Type                                | Null | Key | Default    | Extra          |
        +--------+-------------------------------------+------+-----+------------+----------------+
        | id     | int(10) unsigned                    | NO   | PRI | NULL       | auto_increment |
        | name   | varchar(30)                         | YES  |     | NULL       |                |
        | age    | tinyint(3) unsigned                 | YES  |     | 0          |                |
        | gender | enum('男','女','中性','保密')       | YES  |     | 保密       |                |
        | cls_id | int(10) unsigned                    | YES  |     | NULL       |                |
        | birth  | date                                | YES  |     | 2000-01-01 |                |
        +--------+-------------------------------------+------+-----+------------+----------------+

        -- 向students表插入 一个学生信息
        insert into students values(0, "小李飞刀", 20, "女", 1, "1990-01-01");
        insert into students values(null, "小李飞刀", 20, "女", 1, "1990-01-01");
        insert into students values(default, "小李飞刀", 20, "女", 1, "1990-01-01");

        -- 失败
        -- insert into students values(default, "小李飞刀", 20, "第4性别", 1, "1990-02-01");

        -- 枚举中 的 下标从1 开始 1---“男” 2--->"女"....
        insert into students values(default, "小李飞刀", 20, 1, 1, "1990-02-01");

        -- 部分插入
        -- insert into 表名(列1,...) values(值1,...)
        insert into students (name, gender) values ("小乔", 2);


        -- 多行插入
        insert into students (name, gender) values ("大乔", 2),("貂蝉", 2);
        insert into students values(default, "西施", 20, "女", 1, "1990-01-01"), (default, "王昭君", 20, "女", 1, "1990-01-01");


    -- 修改
    -- update 表名 set 列1=值1,列2=值2... where 条件;
        update students set gender=1; -- 全部都改
        update students set gender=1 where name="小李飞刀"; -- 只要name是小李飞刀的 全部的修改
        update students set gender=1 where id=3; -- 只要id为3的 进行修改
        update students set age=22, gender=1 where id=3; -- 只要id为3的 进行修改
    
    -- 查询基本使用
        -- 查询所有列
        -- select * from 表名;
        select * from students;

        ---定条件查询
        select * from students where name="小李飞刀"; -- 查询 name为小李飞刀的所有信息
        select * from students where id>3; -- 查询 name为小李飞刀的所有信息


        -- 查询指定列
        -- select 列1,列2,... from 表名;
        select name,gender from students;


        -- 可以使用as为列或表指定别名
        -- select 字段[as 别名] , 字段[as 别名] from 数据表 where ....;
        select name as 姓名,gender as 性别 from students;


        -- 字段的顺序
        select id as 序号, gender as 性别, name as 姓名 from students;
    

    -- 删除
        -- 物理删除
        -- delete from 表名 where 条件
        delete from students; -- 整个数据表中的所有数据全部删除
        delete from students where name="小李飞刀";

        -- 逻辑删除
        -- 用一个字段来表示 这条信息是否已经不能再使用了
        -- 给students表添加一个is_delete字段 bit 类型
        alter table students add is_delete bit default 0;
        update students set is_delete=1 where id=6;

