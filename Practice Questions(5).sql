-- Q. Top performing video per creator by revenue
-- SELECT 
--     creator_name,
--     video_id,
--     total_revenue
-- FROM (
--     SELECT 
--         c.creator_name,
--         v.video_id,
--         SUM(r.ad_revenue + r.subscription_revenue + r.other_revenue) AS total_revenue,
--         ROW_NUMBER() OVER (
--             PARTITION BY c.creator_id
--             ORDER BY SUM(r.ad_revenue + r.subscription_revenue + r.other_revenue) DESC
--         ) AS rn
--     FROM revenue r
--     JOIN videos v
--         ON r.video_id = v.video_id
--     JOIN creators c
--         ON v.creator_id = c.creator_id
--     GROUP BY c.creator_id, c.creator_name, v.video_id
-- ) ranked_videos
-- WHERE rn = 1;


-- Q. Video comment sentiment breakdown (positive/negative/neutral).
-- select video_id,
-- sum(case when sentiment = 'Positive' then 1 else 0 end) as Postive_comments,
-- sum(case when sentiment = 'Neutral' then 1 else 0 end) as Netural_comments,
-- sum(case when sentiment = 'Negative' then 1 else 0 end) as Negative_comments
-- from comments
-- group by video_id;

-- Q. Video with impression but 0 clicks (possible data issue).
select video_id,
sum(impressions) as total_impressions,
sum(clicks) as total_clicks
from daily_views
group by video_id
having  SUM(impressions) > 0 AND sum(clicks)= 120

