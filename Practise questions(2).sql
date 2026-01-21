-- Q. show top 10 videos by total views (aggregate daily_views).
-- select video_id,sum(views) as total_views
-- from daily_views
-- group by video_id
-- order by total_views desc
-- limit 10;

-- Q. show unique categories
-- select  distinct category  from videos;

-- Q. count creators per country.
-- select  country, count(creator_id) as no_of_creators
-- from creators
-- group by country

-- Q. get average views per video pre creator.
SELECT 
    c.creator_name,
    v.video_id,
    AVG(dv.views) AS avg_daily_views
FROM daily_views dv
JOIN videos v 
    ON v.video_id = dv.video_id
JOIN creators c 
    ON c.creator_id = v.creator_id
GROUP BY v.video_id, c.creator_name;
