select title, year_of_issue from albums
WHERE date_part('year', year_of_issue) = 2019;
--where year_of_issue between '2019.01.01' and '2019.12.31';

select title, duration from trecks
order by duration desc
limit 1;

select title from trecks
where duration >= '00:03:30';

select title from compilation
where year_of_issue between '2018.01.01' and '2020.12.31';

select name from performers
where name not like '% %';

select title from trecks
where title like '%нас%' or title like '%us%';