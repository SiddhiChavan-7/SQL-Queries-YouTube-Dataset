-- Q. videos where avg_view_duration < 20% of duration
-- SELECT 
--     v.video_id,
--     AVG(dv.avg_view_duration_seconds) AS avg_view_duration,
--     v.duration_seconds
-- FROM daily_views dv
-- JOIN videos v
-- ON v.video_id = dv.video_id
-- GROUP BY v.video_id, v.duration_seconds
-- HAVING AVG(dv.avg_view_duration_seconds) < 0.2 * v.duration_seconds;

-- Q. Videos that gained more than 1K views in a day (spikes).
-- select video_id, views, view_date
-- from daily_views
-- where views>1000;

-- Q. For each creator, total revenue (ad + subscription + other)
-- select c.creator_name,
-- sum(r.ad_revenue+ r.subscription_revenue+ r.other_revenue) as total_revenue
-- from revenue r
-- join videos v
-- on v.video_id = r.video_id
-- join creators c
-- on v.creator_id = c.creator_id
-- group by c.creator_id, c.creator_name;

-- Q. For each video, last 7-days rolling average views
select video_id,
view_date,
views,
round(
avg(views) over(
partition by video_id
order by view_date
rows between 6 preceding and current row
)
) as rolling_7_day_avg_views
from daily_views



