SELECT COUNT(P.room_id) AS `投稿数`,`room_name`
FROM `posts` AS P
    JOIN (SELECT `user_id`,`is_deleted`,`name` FROM `users` WHERE `is_deleted` = 0)AS U
    ON P.`post_user_id` = U.`user_id`
    JOIN `chat_rooms` AS C
    ON P.`room_id` = C.`room_id`
    WHERE P.`is_deleted` = 0
    GROUP BY P.`room_id`
    ORDER BY `投稿数` DESC;
