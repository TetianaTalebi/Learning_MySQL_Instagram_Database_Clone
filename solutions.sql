-- 1. Finding 5 oldest users

SELECT * FROM users ORDER BY created_at ASC LIMIT 0,5;

-- 2. Most popular registration date

SELECT DAYNAME(created_at) AS day,
       COUNT(*) AS total
FROM users
GROUP BY day
ORDER BY total DESC LIMIT 0,1;


-- 3. Finding the users who have never posted a photo
-- (i.e. identifying inactive users)

SELECT username FROM users
LEFT JOIN photos ON users.id=photos.user_id
WHERE photos.id IS NULL;



