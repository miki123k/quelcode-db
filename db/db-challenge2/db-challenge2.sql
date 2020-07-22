CREATE TABLE `users` (
    `user_id` int(11) NOT NULL AUTO_INCREMENT,
    `name` varchar(100) NOT NULL,
    `password` varchar(100) NOT NULL,
    `mail_address` varchar(100) NOT NULL,
    `office_phone_number` varchar(13),
    `mobile_phpne_number` varchar(13),
    `introduction` varchar(1000),
    `is_deleted` tinyint(1) DEFAULT 0 NOT NULL,
    `created_at` datetime NOT NULL,
    `updated_at` datetime NOT NULL,
    PRIMARY KEY(`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

CREATE TABLE `joins` (
    `room_id` int(11) FOREIGN KEY(`room_id`) REFERENCES `chat_rooms`(`room_id`) NOT NULL,
    `user_id` int(11) FOREIGN KEY(`user_id`) REFERENCES `users`(`user_id`) NOT NULL,
    `joined_at` datetime NOT NULL,
    PRIMARY KEY(`room_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8

CREATE TABLE `chat_rooms` (
    `room_id` int(11) NOT NULL AUTO_INCREMENT,
    `is_direct_chat` tinyint(1) DEFAULT 0 NOT NULL,
    `room_name` varchar(100) NOT NULL,
    `description` varchar(1000),
    `is_file_allowed` tinyint(1) DEFAULT 1 NOT NULL,
    `create_user_id` int(11) FOREIGN KEY(`user_id`) REFERENCES `users`(`user_id`) NOT NULL,
    `update_user_id` int(11) FOREIGN KEY(`user_id`) REFERENCES `users`(`user_id`) NOT NULL,
    `is_deleted` tinyint(1) DEFAULT 0 NOT NULL,
    `created_at` datetime NOT NULL,
    `updated_at` datetime NOT NULL,
    PRIMARY KEY(`room_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

CREATE TABLE `posts` (
    `post_id` int(11) NOT NULL AUTO_INCREMENT,
    `room_id` int(11) FOREIGN KEY(`room_id`) REFERENCES `chat_rooms`(`room_id`) NOT NULL,
    `message` varchar(1000) NOT NULL,
    `attachment_name`varchar(100),
    `post_user_id` int(11) FOREIGN KEY(`user_id`) REFERENCES `users`(`user_id`) NOT NULL,
    `update_user_id` int(11) FOREIGN KEY(`user_id`) REFERENCES `users`(`user_id`) NOT NULL,
    `is_deleted` tinyint(1) DEFAULT 0 NOT NULL,
    `posted_at` datetime NOT NULL,
    `updated_at` datetime NOT NULL,
    PRIMARY KEY(`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

CREATE TABLE `tasks` (
    `task_id` int(11) NOT NULL AUTO_INCREMENT,
    `room_id` int(11) FOREIGN KEY(`room_id`) REFERENCES `chat_rooms`(`room_id`) NOT NULL,
    `task` varchar(1000) NOT NULL,
    `assigned_user_id` int(11) FOREIGN KEY(`user_id`) REFERENCES `users`(`user_id`) NOT NULL,
    `limit` datetime,
    `is_completed` tinyint(1) DEFAULT 0 NOT NULL,
    `create_user_id` int(11) FOREIGN KEY(`user_id`) REFERENCES `users`(`user_id`) NOT NULL,
    `update_user_id` int(11) FOREIGN KEY(`user_id`) REFERENCES `users`(`user_id`) NOT NULL,
    `is_deleted` tinyint(1) DEFAULT 0 NOT NULL,
    `created_at` datetime NOT NULL,
    `updated_at` datetime NOT NULL,
    PRIMARY KEY(`task_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;


