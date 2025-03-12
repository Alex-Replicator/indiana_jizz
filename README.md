<div align="center">

<svg width="500" height="300" xmlns="http://www.w3.org/2000/svg">
  <!-- Фон -->
  <rect width="500" height="300" fill="#f9f9f9" rx="15" ry="15" />
  
  <!-- Шляпа в стиле Индианы Джонса -->
  <path d="M100,120 C100,100 150,80 250,80 C350,80 400,100 400,120 L420,130 C420,140 400,150 390,150 L110,150 C100,150 80,140 80,130 Z" fill="#654321" />
  <path d="M110,150 L130,210 L370,210 L390,150 Z" fill="#8B4513" />
  <ellipse cx="250" cy="80" rx="150" ry="20" fill="#8B5A2B" />
  
  <!-- Кнут -->
  <path d="M370,160 Q400,140 420,110 Q430,100 435,85" fill="none" stroke="#000" stroke-width="3" />
  
  <!-- Контейнеры Docker -->
  <rect x="190" y="170" width="40" height="30" fill="#0db7ed" />
  <rect x="235" y="170" width="40" height="30" fill="#0db7ed" />
  <rect x="280" y="170" width="40" height="30" fill="#0db7ed" />
  <rect x="190" y="140" width="40" height="30" fill="#0db7ed" />
  <rect x="235" y="140" width="40" height="30" fill="#0db7ed" />
  <rect x="235" y="110" width="40" height="30" fill="#0db7ed" />
  
  <!-- Текст Логотипа -->
  <text x="250" y="250" font-family="Impact, sans-serif" font-size="48" fill="#654321" text-anchor="middle">INDIANA JIZZ</text>
  <text x="250" y="275" font-family="Arial, sans-serif" font-size="16" fill="#555" text-anchor="middle">Docker-окружение для веб-разработки</text>
</svg>

<h1>Docker-окружение для веб-разработки</h1>

[![Docker](https://img.shields.io/badge/docker-%230db7ed.svg?style=for-the-badge&logo=docker&logoColor=white)](https://www.docker.com/)
[![Nginx](https://img.shields.io/badge/nginx-%23009639.svg?style=for-the-badge&logo=nginx&logoColor=white)](https://nginx.org/)
[![MySQL](https://img.shields.io/badge/mysql-%2300f.svg?style=for-the-badge&logo=mysql&logoColor=white)](https://www.mysql.com/)
[![PHP](https://img.shields.io/badge/php-%23777BB4.svg?style=for-the-badge&logo=php&logoColor=white)](https://www.php.net/)
[![Memcached](https://img.shields.io/badge/memcached-%233867d6.svg?style=for-the-badge&logo=memcached&logoColor=white)](https://memcached.org/)

[![Лицензия: MIT](https://img.shields.io/badge/Лицензия-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![GitHub stars](https://img.shields.io/github/stars/Alex-Replicator/indiana_jizz.svg?style=social&label=Star&maxAge=2592000)](https://GitHub.com/Alex-Replicator/indiana_jizz/stargazers/)
[![GitHub issues](https://img.shields.io/github/issues/Alex-Replicator/indiana_jizz.svg)](https://GitHub.com/Alex-Replicator/indiana_jizz/issues/)
</div>

---

## 📖 Описание

**Indiana Jizz** - это готовая Docker-сборка для веб-разработки, включающая в себя полный LEMP-стек (Linux, Nginx, MySQL, PHP) с дополнительными инструментами PHPMyAdmin и Memcached. Оптимально подходит для интеграции в существующие проекты в качестве Git подмодуля.

---

## ✨ Особенности

- 🔒 Полная изоляция окружения разработки
- 🔄 Автоматическая настройка всех компонентов
- 🔧 Гибкая конфигурация через переменные окружения
- 📁 Монтирование исходного кода проекта для разработки в режиме реального времени
- 🚀 Поддержка как dev-, так и prod-окружений
- 💪 Отсутствие ограничений на использование ресурсов хост-машины
- 📊 Встроенный сервис для кеширования (Memcached)

---

## 🛠️ Требования

- 🐋 Docker 20.10.x+
- 🔗 Docker Compose 2.x+
- 🔄 Git 2.13+

---

## 📥 Установка в качестве подмодуля

### 🌱 Добавление в новый проект

```bash
# Инициализация Git репозитория (если еще не инициализирован)
git init

# Добавление Indiana Jizz как подмодуля
git submodule add https://github.com/Alex-Replicator/indiana_jizz.git

# Создание директории для исходного кода (если не существует)
mkdir -p src
```

### 🔄 Добавление в существующий проект

```bash
# Перейдите в корень существующего проекта
cd /путь/к/вашему/проекту

# Добавление Indiana Jizz как подмодуля
git submodule add https://github.com/Alex-Replicator/indiana_jizz.git

# Если пул-реквест ссылается на подмодуль, используйте:
git submodule update --init --recursive
```

### 📋 Клонирование проекта с подмодулем

```bash
# Клонирование основного репозитория с подмодулями
git clone --recurse-submodules https://github.com/ваш_аккаунт/ваш_проект.git

# Альтернативный вариант (если забыли флаг --recurse-submodules)
git clone https://github.com/ваш_аккаунт/ваш_проект.git
cd ваш_проект
git submodule init
git submodule update
```

---

## ⚙️ Настройка и запуск

1. 📄 Скопируйте `.env.example` в `.env` и настройте переменные окружения:
```bash
cd indiana_jizz
cp .env.example .env
# Отредактируйте файл .env согласно вашим потребностям
```

2. ⚠️ **Важно**: Убедитесь, что переменная `SOURCE_CODE_PATH` в `.env` указывает на директорию с исходным кодом вашего проекта (обычно `../src` или другой относительный путь).

3. 🚀 Запустите сборку:
```bash
cd indiana_jizz
docker-compose up -d
```

4. 🌐 Доступ к сервисам:
   - 🌎 Веб-сайт: http://localhost:{WEB_PORT} (указан в .env)
   - 🗄️ PHPMyAdmin: http://localhost:{PMA_PORT} (указан в .env)
   - 📊 Memcached: localhost:{MEMCACHED_PORT} (указан в .env)

---

## 📂 Структура проекта

```
ваш_проект/
├── 📁 src/                     # Исходный код вашего проекта
├── 📁 indiana_jizz/            # Подмодуль с Docker-окружением
│   ├── 📄 docker-compose.yml   # Основной файл Docker Compose
│   ├── 📄 docker-compose.prod.yml # Конфигурация для продакшн-окружения
│   ├── 📄 .env                 # Файл переменных окружения
│   ├── 📁 services/            # Конфигурации для сервисов
│   │   ├── 📁 nginx/           # Конфигурация Nginx
│   │   ├── 📁 php/             # Конфигурация PHP с поддержкой Memcached
│   │   ├── 📁 mysql/           # Конфигурация MySQL
│   │   └── 📁 phpmyadmin/      # Конфигурация PHPMyAdmin
│   └── 📄 README.md            # Документация (текущий файл)
└── 📄 .gitmodules              # Файл конфигурации подмодулей Git
```

---

## 🔄 Обновление подмодуля

Для обновления Indiana Jizz до последней версии:

```bash
cd indiana_jizz
git pull origin main
cd ..
git add indiana_jizz
git commit -m "Обновление подмодуля Indiana Jizz"
```

---

## 💻 Разработка с использованием Indiana Jizz

1. 📁 Разместите исходный код вашего проекта в папке, указанной в переменной `SOURCE_CODE_PATH` (обычно это папка `../src` относительно подмодуля)
2. 🔄 После изменения кода в указанной папке, изменения сразу отражаются в работающем приложении
3. 🗄️ Для управления базой данных используйте PHPMyAdmin или подключайтесь напрямую через клиент MySQL
4. 📊 Для кеширования данных используйте Memcached

---

## 🚀 Настройка для продакшн-окружения

Для запуска в продакшн-режиме используйте специальную конфигурацию:
```bash
cd indiana_jizz
docker-compose -f docker-compose.yml -f docker-compose.prod.yml up -d
```

---

## 🤝 Вклад в проект

Мы приветствуем вклады в проект! Пожалуйста, создавайте pull requests или сообщайте об ошибках через GitHub Issues.

---

## 📄 Лицензия

[MIT](LICENSE)

---

## 👨‍💻 Автор

**Alex Replicator** - [GitHub](https://github.com/Alex-Replicator/)

---

<div align="center">
  
**Сделано с ❤️ для веб-разработчиков**

<details>
<summary>🎨 О названии проекта</summary>
<br>
Indiana Jizz - отсылка к культовому приключенческому герою, который так же, как и этот проект, помогает исследователям достигать своих целей с минимальными сложностями.
</details>
</div> 