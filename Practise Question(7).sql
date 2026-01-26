-- Q. Rank videos by total views within each category (Rank/Dense_Rank)

-- select video_id,
--  category,
--  total_views,
--  rank() over(
--  partition by category
--  order by total_views desc
--  ) as rank_in_category
--  from(
--  select
--  v.video_id,
--  v.category,
--  sum(dv.views) as total_views
--  from videos v
--  join daily_views dv
--  on v.video_id = dv.video_id
--  group by v.video_id , v.category
--   ) t;

-- Q. Running total of views per video (window).

-- select video_id,
-- view_date,
-- views,
-- sum(views) over(
-- partition by video_id
-- order by view_date
-- rows between unbounded preceding and current row) as running_Total_views
-- from daily_views;

-- Q. Monthly growth rate of views for each video (LAG)
select video_id,
month,
monthly_views,
lag(monthly_views) over(
partition by video_id
order by month) as prev_month_views,
round(
(monthly_views - lag(monthly_views)over(
partition by video_id
order by month
)) /
lag(monthly_views) over(
partition by video_id
order by month
),
2
) as monthly_growth_rate
from(
select video_id,
date_format(view_date, '%Y-%m') as month,
sum(views) as monthly_views
from daily_views
group by video_id, date_format(view_date, '%Y-%m') 
) t;



