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

-- 4. Identifying the most popular photo and a user who created it

SELECT photos.id, photos.image_url, users.username, COUNT(*) AS total FROM photos
INNER JOIN users ON users.id = photos.user_id
INNER JOIN likes ON photos.id = likes.photo_id
GROUP BY photos.id
ORDER BY total DESC LIMIT 0,1;

-- 5. Calculating AVG number of photos per user
-- We have to take the total number of photos and divide it by the total number of users.
-- To divide one by another we have to use subqueries.

SELECT 
    ( SELECT COUNT(*) FROM photos ) / 
    (SELECT COUNT(*) FROM users) 
AS 'AVG number of photos per user';

-- 6. Finding 5 the most popular hashtags

SELECT tags.tag_name, COUNT(*) as total from tags
INNER JOIN photo_tags ON photo_tags.tag_id = tags.id
GROUP BY tags.id
-- Grouping by tags.id instead of grouping by tags.tag_name is more easier
-- because in this case we have to work with integers
-- instead of working with strings
ORDER BY total DESC LIMIT 0,5;

-- 7. Finding the users who liked every single photo on the site

SELECT username, COUNT(*) AS num_likes FROM users
INNER JOIN likes ON likes.user_id=users.id
GROUP BY users.id
HAVING num_likes = (SELECT COUNT(*) FROM photos);








