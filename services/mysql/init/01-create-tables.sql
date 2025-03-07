-- Установка кодировки UTF-8
SET NAMES utf8mb4;
SET CHARSET utf8mb4;

-- Создание тестовой таблицы
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Добавление тестовых данных
INSERT INTO `users` (`username`, `email`, `password`) VALUES
('admin', 'admin@example.com', '$2y$10$XKFqmQZZv2I5KcnN6k.GRuOESZ3FIqy2mmbY8OVkH5fEVReIkBT8K'), -- password: admin123
('test_user', 'test@example.com', '$2y$10$P1NX7MnvxVFXq9Ov/0nE9uLyLiTdEj6XQnlnCbCRU3MmsCZF03u/6'); -- password: test123

-- Создание таблицы для демонстрации связей
CREATE TABLE IF NOT EXISTS `posts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Добавление тестовых постов
INSERT INTO `posts` (`user_id`, `title`, `content`) VALUES
(1, 'Приветственный пост', 'Добро пожаловать в тестовую базу данных WSW!'),
(2, 'Тестовый пост', 'Это тестовый пост от тестового пользователя.'); 