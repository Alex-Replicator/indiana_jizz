# Журнал архитектурных решений

## 08.03.2023: Базовая архитектура Docker-сборки
**Контекст:** Необходимо создать Docker-сборку для проекта WSW, которая будет включать в себя LEMP-стек и PHPMyAdmin.
**Решение:** Реализовать сборку с использованием отдельных контейнеров для Nginx, PHP-FPM, MySQL и PHPMyAdmin, с монтированием исходного кода из папки `wsw_site`.
**Обоснование:** Разделение сервисов на отдельные контейнеры обеспечивает изоляцию, масштабируемость и удобство обновления каждого компонента независимо.
**Последствия:** Такой подход позволит легко добавлять новые сервисы и масштабировать существующие, а также обеспечит единообразие среды разработки для всех разработчиков проекта. 