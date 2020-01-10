\set aid getnext(0)
\set loginId getnext(1)
select * from keqiao where flgt_id = ':aid';
select * from cg40_rrt where login_name = ':loginId';
