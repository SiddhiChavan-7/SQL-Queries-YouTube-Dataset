-- Q. total impressions and clicks per video
-- select v.video_id,
-- sum(clicks ) as total_clicks,
-- sum(impressions) as total_impression
-- from daily_views dv
-- join videos v
-- on v.video_id = dv.video_id
-- group by v.video_id

-- Q. compute CTR = clicks / impression per day.
-- select view_date,
-- sum(clicks) as clicks_per_day,
-- sum( impressions) as impressions_per_day,
-- sum(clicks)/ nullif(sum(impressions),0) as ctr
-- from daily_views
-- group by view_date;

-- Q. Average watch time per view(watch_time_seconds / views).
-- SELECT 
--     video_id,
--     SUM(watch_time_seconds) / NULLIF(SUM(views), 0) AS avg_watch_time_per_view_sec
-- FROM daily_views
-- GROUP BY video_id;

-- Q. Daily views trend for a single video.
-- select video_id, view_date,views 
-- from daily_views
-- where video_id = 7
-- order by view_date

-- Q. views per category
-- select sum(views) as total_views, v.category
-- from daily_views dv
-- join videos v
-- on v.video_id = dv.video_id
-- group by  v.category;

-- Q. top 5 videos by watch_time_seconds
-- select sum(watch_time_seconds) as total_watch_time, v.video_id
-- from daily_views dv
-- join videos v
-- on v.video_id = dv.video_id
-- group by v.video_id
-- order by total_watch_time desc
-- limit 5;

-- Q. Average like/dislike per video.
-- SELECT 
--     video_id,
--     AVG(likes) AS avg_likes,
--     AVG(dislikes) AS avg_dislikes
-- FROM likes_dislikes
-- GROUP BY video_id;


-- Q. list videos with more dislike than like or vise versa
-- select video_id,
-- sum(likes) as total_likes,
-- sum(dislikes) as total_dislike
-- from  likes_dislikes 
-- group by video_id
-- having sum(dislikes) < sum(likes);


