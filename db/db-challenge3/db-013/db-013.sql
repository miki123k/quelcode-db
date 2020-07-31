BEGIN;
UPDATE `users` 
SET `is_deleted`= 1,
	`updated_at`= CURRENT_TIMESTAMP
WHERE `office_phone_number` IS NULL
AND `mobile_phone_number` IS NULL;
COMMIT;
