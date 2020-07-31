BEGIN ;
UPDATE `tasks`
SET `is_completed`= 1,
`update_user_id` = 1,
`updated_at` = CURRENT_TIMESTAMP
WHERE `created_at`
BETWEEN '2020-04-26 09:00' 
AND '2020-04-26 11:30'
AND `is_deleted`= 0;
COMMIT;
