BEGIN;
UPDATE `chat_rooms`
SET  `is_file_allowed` = 0,
    `update_user_id`= 1,
    `updated_at`= CURRENT_TIMESTAMP
WHERE `room_id` NOT IN (SELECT `room_id` FROM `joins` WHERE `user_id` = 1 GROUP BY `room_id`)
AND `is_deleted` = 0;
COMMIT;
