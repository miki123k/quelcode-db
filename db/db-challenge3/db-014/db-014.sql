BEGIN;
DELETE FROM `joins`
WHERE `user_id` IN (SELECT `user_id` FROM `users` WHERE `is_deleted` = 1);
COMMIT;
