FROM nginx:stable-alpine

# Копируем основной конфиг nginx
COPY conf/nginx.conf /etc/nginx/nginx.conf

# Копируем виртуальные хосты или настройки серверов
COPY conf/conf.d/ /etc/nginx/conf.d/

# Создаем директорию кэша и даём права
RUN mkdir -p /var/cache/nginx/ip-tv-cache && \
    chown -R nginx:nginx /var
