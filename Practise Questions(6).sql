-- List videos and their peak daily view date.

-- select video_id,
-- view_date,
-- views
-- from(
-- select dv.video_id,
-- dv.view_date,
-- dv. views,
-- row_number() over(
-- partition by dv.video_id
-- order by dv.views desc
-- ) as rn
-- from daily_views dv
-- ) ranked 
-- where rn = 1
-- order by video_id; 

-- Q. Show creators who published > 2 videos

-- SELECT
--     c.creator_name,
--     COUNT(v.video_id) AS total_videos
-- FROM creators c
-- JOIN videos v
--     ON c.creator_id = v.creator_id
-- GROUP BY c.creator_id, c.creator_name
-- HAVING COUNT(v.video_id) > 2;


-- Q. videos with muliple high-spike days.
-- select video_id,
-- count(*) as spike_days
-- from daily_views
-- where views > 1000
-- group by video_id
-- having count(*) > 1;


-- Q. Find videos with payment revenue but zero views.
-- select v.video_id
-- from videos v
-- join revenue r
-- on v.video_id = r.video_id
-- LEFT JOIN daily_views dv
--     ON v.video_id = dv.video_id
-- group by v.video_id
-- having sum(r.ad_revenue + r.subscription_revenue + r.other_revenue) > 0
-- and coalesce(sum(dv.views),0) = 0;

-- Q. Creator- wise average ctr ie. click through rate 

SELECT
    c.creator_name,
    ROUND(
        AVG(
            CASE 
                WHEN dv.impressions > 0 
                THEN dv.clicks / dv.impressions 
                ELSE 0 
            END
        ), 4
    ) AS avg_ctr
FROM daily_views dv
JOIN videos v
    ON dv.video_id = v.video_id
JOIN creators c
    ON v.creator_id = c.creator_id
GROUP BY c.creator_id, c.creator_name;

