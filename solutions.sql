-- 1. Finding 5 oldest users

SELECT * FROM users ORDER BY created_at ASC LIMIT 0,5;

-- 2. Most popular registration date

SELECT DAYNAME(created_at) AS day,
       COUNT(*) AS total
FROM users
GROUP BY day
ORDER BY total DESC LIMIT 0,1;




