SELECT `room_id`,`is_direct_chat`,`room_name`,`description`,`create_user_id`,`update_user_id`,`is_deleted`,`created_at`,`updated_at`,
    CASE `is_file_allowed`
        WHEN 1 THEN '許可'
        WHEN 0 THEN '禁止'
    END AS 'is_file_allowed'
    FROM `chat_rooms`
    WHERE `is_deleted` = 0
    AND `description` LIKE '%ダイレクトチャット'
    ORDER BY `room_id` ASC;
