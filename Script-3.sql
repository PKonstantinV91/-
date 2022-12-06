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



select mg.title, count(p.name) from musical_genres mg
left join genresperformers g on mg.id = g.genres_id
left join performers p on g.performers_id = p.id
group by mg.title
order by count(p.id) desc;


select count(trecks.id) from trecks
join albums a on trecks.albums_id = a.id 
WHERE year_of_issue between '2019.01.01' and '2020.12.31';

select t.title, a.year_of_issue from albums as a
left join trecks t on t.albums_id = a.id
WHERE year_of_issue between '2019.01.01' and '2020.12.31';


select a.title, AVG(t.duration) from albums a
left join trecks t on t.albums_id = a.id
group by a.title;

select distinct p.name from performers p 
where p.name not in (
    select distinct p.name from performers p
    left join performersalbums p2 on p.id = p2.performers_id 
    left join albums a on a.id = p2.albums_id
    WHERE a.year_of_issue between '2020.01.01' and '2020.12.31'
);


select distinct c.title from compilation c
left join compilationtreck ct on c.id = ct.compilation_id
left join trecks t on t.id = ct.trecks_id
left join albums a on a.id = t.albums_id
left join performersalbums pa on pa.albums_id = a.id
left join performers p on p.id = pa.performers_id
where p.name like '%Zivert%';


select a.title from albums a
left join performersalbums pa on a.id = pa.albums_id
left join performers p  on p.id = pa.performers_id
left join genresperformers gp on p.id = gp.performers_id
left join musical_genres mg on mg.id = gp.genres_id
group by a.title
having count(distinct mg.title) > 1;


select t.title from trecks t
left join compilationtreck ct on t.id = ct.trecks_id
where ct.trecks_id is null;


select p.name, t.duration from trecks t
left join albums a on a.id = t.albums_id
left join performersalbums pa on pa.albums_id = a.id
left join performers p on p.id = pa.performers_id
group by p.name, t.duration
having t.duration = (select min(duration) from trecks);


SELECT albums.title, count(*) FROM albums
JOIN trecks t ON albums.id = t.albums_id
GROUP BY albums.title
having count(*) = (SELECT count(*) FROM albums
JOIN trecks t ON albums.id = t.albums_id
GROUP BY albums.title
ORDER BY count
LIMIT 1);




