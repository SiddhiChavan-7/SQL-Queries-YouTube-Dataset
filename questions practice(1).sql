-- Q. list all video and their creator names.

-- select v.* ,creator_name
-- from  videos v
-- join creators 
-- on v.creator_id = creators.creator_id;

-- Q. count total videos per creators 
SELECT creator_name, COUNT(video_id) AS TotalVideos
FROM videos
GROUP BY creator_name;

  