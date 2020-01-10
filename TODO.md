##添加单行值当成数组使用,可以动态使用分隔符,预计效果如下:
```
压测脚本ss.sql
\set aid getnext(0)
select * from tbl where id=:aid[0] and times = :aid[1]

压测命令
./pgbench -f ss.sql --seqread-file /tmp/seq.csv -Mprepared -P1 -r -n -c 10 -T 10 benchmark

文本内容/tmp/seq.csv

0001  2019-02-12 00:00:00
...
1000  2019-04-01 23:59:59

查询QUERY

 select * from tbl where id='0001' and times = '2019-02-12 00:00:00';
 ...
  select * from tbl where id='1000' and times = '2019-04-01 23:59:59';
  ```
