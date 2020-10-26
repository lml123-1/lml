#!/bin/bash

#this is my First shell


#   $0      当前程序的名称
#   $n      当前程序的第n个参数，n=1,2,3.....9
#   $*      当前程序的所有参数（都不含本身）
#   $#      当前程序的参数个数
#   $?      命令或程序执行完后，一般返回0表示执行成功
#   $UID    当前用户的ID
#   $PWD    当前所在目录
#



#测试数字大小
num=100 #注意赋值时不能打空格
if (($num > 111));then #想加else必须用到then
    echo "this num is $sum greater!"
else
    echo "this not"

fi


#测试目录是否存在，不存在则新建（注意，中括号之间必须要空格）
if [ ! -d ./data ];then #注意空格
    mkdir -p ./data
    echo "succes ok"
else 
    echo "err not dir c"
fi


#   用于逻辑运算符解析
#   -f  判断文件是否存在
#   -d  判断目录是否存在
#   -eq 等于     下面的应用于: 整形比较
#   -ne 不等于
#   -lt 小于
#   -gt 大于
#   -le 小于或等于
#   -ge 大于或等于
#   -a  双方都成立（and）
#   -o  单方成立（or）
#   -z  空字符串    相当于c里面的NULL



#循环语句for
for i in `seq 4`   #后面由seq详解
do
    echo "num is $i"    #上面那句把1~4赋值给了i
done

#seq    seq     squeue 输出系列化的东西
#   seq -f '%03g' 4  -format=格式    表示输出宽度为3的1~4数字
#   seq -s '' 4 -separator=字符串    使用指定字符串分割数字    
#   seq -w 1 4  -w                   在列前添加0，使得宽度相同[自动补位]

#   ``  注意这个玩意，相当于输入命令得到的返回值
for i in `find ./data -name "1.c"`  #意思时找到1.c,并打包
do 
    tar -czf 20201.tgz $i    #这里的i没有类型
done
#写到这里，我只想说一句，shell牛逼



#while while 这里开始写while
i=1
while [[ $i -lt 3 ]];do   #一般这种打两个括号 
    echo $i
    ((i++))     #这里我试过不加括号，那是一个死循环，然后我老实的加上了
done

#while逐渐读取某个文件
while read line
do
    echo $line
done <./data/1.c
#done < /etc/passwd #将/etc/passwd内容输入到while read 循环中
#相当于赋值给   line



#Until Until 循环语句
#条件判断数字
a=10
until [[ $a -lt 7 ]];do #知道满足条件，才退出，否则执行循环
    echo $a
    ((a--))
done



#case case case 语句
#创建选择参数脚本 #目前没看懂什么意思
case $1 in
    monitor_log)
    monitor_log
    ;;
    archive_log)
    archive_log
    ;;
    *)
    echo "usage:{ $0 monitor_log |archive_log |help }"
    ;;
esac







