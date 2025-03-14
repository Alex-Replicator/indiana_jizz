# Информация об ассистенте
Баллы ассистента: 630
Текущий уровень: Эксперт

# Описание проекта
## Indiana Jizz - Docker-сборка для WSW проекта
Проект представляет собой докер-сборку для веб-приложения, которая включает в себя сервисы для полноценного стека разработки веб-приложения.

### Стек
Используются следующие технологии:
- Frontend
  - Nginx (веб-сервер)
- Backend
  - PHP
- СУБД
  - MySQL
- DevOps
  - Docker & Docker Compose
  - PHPMyAdmin (для управления БД)

### Файловая структура
```
wsw/
├── indiana_jizz/              # Докер-сборка (git подмодуль)
│   ├── docker-compose.yml     # Основной файл Docker Compose
│   ├── .env                   # Файл с переменными окружения
│   ├── services/              # Конфигурации для сервисов
│   │   ├── nginx/             # Конфигурация Nginx
│   │   ├── php/               # Конфигурация PHP
│   │   ├── mysql/             # Конфигурация MySQL
│   │   └── phpmyadmin/        # Конфигурация PHPMyAdmin
│   └── tasks/                 # Файлы с задачами и прогрессом
│       ├── general.md         # Общая информация о проекте
│       ├── architecture.md    # Архитектурное решение
│       ├── decisions.md       # Журнал архитектурных решений
│       └── progress.md        # Прогресс разработки
├── wsw_site/                  # Исходный код проекта (монтируется в контейнеры)
```

### Взаимодействие компонентов
- Nginx принимает HTTP-запросы и проксирует их на PHP-FPM
- PHP обрабатывает запросы и взаимодействует с MySQL для хранения данных
- PHPMyAdmin обеспечивает веб-интерфейс для управления базой данных MySQL
- Папка `wsw_site` монтируется в контейнеры для разработки в режиме реального времени

### Дополнительная информация
- Все сервисы запускаются в отдельных контейнерах Docker
- Конфигурация настраивается через переменные окружения в файле .env
- Порты для сервисов выбираются автоматически, чтобы избежать конфликтов 