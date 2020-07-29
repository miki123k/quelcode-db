SELECT `room_name`,`name`,DATE_FORMAT(`joined_at`,'%Y-%m-%d') AS `joined_at`
FROM `joins` AS J
    JOIN (SELECT `user_id`,`is_deleted`,`name` FROM `users` WHERE `is_deleted` = 0) AS U
    ON  J.`user_id` = U.`user_id`
    JOIN `chat_rooms` AS C
    ON J.`room_id` = C.`room_id`
    ORDER BY `joined_at` ASC;
