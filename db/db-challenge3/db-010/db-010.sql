SELECT `name`,`room_name`,`posted_at`
FROM `posts` AS P
JOIN (SELECT `user_id`,`is_deleted`,`name` FROM `users` WHERE `is_deleted` = 0) AS U
    ON P.`post_user_id` = U.`user_id`
    JOIN `chat_rooms` AS C 
    ON P.`room_id` = C.`room_id`
WHERE (P.`room_id`,`posted_at`) IN ( 
    SELECT P.`room_id`,MAX(`posted_at`)
    FROM `posts`
    WHERE `is_deleted` = 0
    GROUP BY `room_id` )
    ORDER BY P.`room_id` ASC;
