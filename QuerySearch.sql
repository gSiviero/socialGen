use TinySocial;
select * from  GleambookUsers GU inner join GleambookMessages GM on GU.id =GM.author_id;
