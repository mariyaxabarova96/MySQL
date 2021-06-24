-- Пусть задан некоторый пользователь.
-- Из всех друзей этого пользователя найдите человека, который больше всех общался с нашим пользоваетелем.

WITH T AS (
	SELECT to_user_id AS best_friend_id FROM messages WHERE from_user_id = 1
	union ALL
	SELECT from_user_id  FROM messages WHERE to_user_id = 1
)
SELECT U.fullname, count(*) as rate FROM T
	INNER JOIN users U 
		ON U.id = T.best_friend_id
GROUP BY best_friend_id
ORDER BY rate DESC
LIMIT 1;

-- 3) Подсчитать общее количество лайков, которые получили 10 самых молодых пользователей.
WITH YU AS -- Young Users 
(
	SELECT id FROM users U
	  INNER JOIN profiles P 
	  	ON P.user_id = U.id
	ORDER BY P.birthday
	LIMIT 10
)
SELECT count(L.id) 
FROM likes L
	LEFT JOIN like_types LTU ON LTU.id = L.like_type_id AND LTU.name = 'user'
	LEFT JOIN YU YUU ON YUU.id = L.target_id 
	
	LEFT JOIN like_types LTMD ON LTMD.id = L.like_type_id AND LTMD.name = 'media'
	LEFT JOIN media MD ON MD.id = L.target_id
	
	LEFT JOIN like_types LTMS on LTMS.id = L.like_type_id and LTMS.name = 'massage'
	LEFT JOIN messages MS on MS.id = L.target_id
	
	INNER JOIN YU ON YU.id in (YUU.id, MD.user_id, MS.from_user_id) 


-- 4) Определить кто больше поставил лайков (всего) - мужчины или женщины?
SELECT sex FROM (
	SELECT sex, COUNT((SELECT COUNT(*) FROM likes as L where L.user_id = P.user_id)) as gender_likes_count FROM profiles as P
	WHERE sex = 'm'
	GROUP BY sex
	UNION ALL
	SELECT sex, COUNT((SELECT COUNT(*) FROM likes as L where L.user_id = P.user_id)) FROM profiles as P
	WHERE sex = 'f'
	GROUP BY sex
) AS T
GROUP BY sex
ORDER BY MAX(gender_likes_count) DESC
LIMIT 1;


-- 5) Найти 10 пользователей, которые проявляют наименьшую активность в использовании социальной сети.

WITH T AS (
	SELECT from_user_id as user_id, COUNT(*) as rnk  FROM messages -- Неактивные пользователи мало отправляют сообщения
	GROUP BY from_user_id
	UNION ALL
	SELECT user_id, COUNT(*)  FROM likes -- Неактивные пользователи мало лайкуют
	GROUP BY user_id
	UNION ALL
	SELECT user_id, COUNT(*)  FROM friendship -- И друзей у таких пользователей мало
	GROUP BY user_id
	UNION ALL
	SELECT friend_id, COUNT(*)  FROM friendship 
	GROUP BY friend_id
	UNION ALL
	SELECT user_id, COUNT(*)  FROM communities_users
	GROUP BY user_id
)
SELECT fullname,  SUM(T.rnk) AS rnk
FROM T
	INNER JOIN users U on U.id = T.user_id
GROUP BY fullname
ORDER BY rnk
LIMIT 10;