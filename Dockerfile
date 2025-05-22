# Используем официальный минимальный образ nginx
FROM nginx:stable-alpine

# Копируем основной конфигурационный файл nginx
COPY conf/nginx.conf /etc/nginx/nginx.conf

# Копируем конфиги виртуальных хостов (если есть)
COPY conf/conf.d/ /etc/nginx/conf.d/

# Создаем директорию под кэш и выставляем права
RUN mkdir -p /var/cache/nginx/ip-tv-cache && \
    chown -R nginx:nginx /var/cache/nginx

# Открываем порт 80
EXPOSE 80

# Запуск nginx в фоновом режиме
CMD ["nginx", "-g", "daemon off;"]
