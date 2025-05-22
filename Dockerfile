FROM nginx:stable-alpine

# Скачиваем и применяем конфиги из GitHub
RUN mkdir -p /opt/nginx-setup \
    && wget https://github.com/aidarkz/my-nginx-proxy2/archive/refs/heads/master.zip -O /opt/nginx-setup/master.zip \
    && unzip -o /opt/nginx-setup/master.zip -d /opt/nginx-setup \
    && cp -f /opt/nginx-setup/my-nginx-proxy2-master/conf/nginx.conf /etc/nginx/nginx.conf \
    && cp -r /opt/nginx-setup/my-nginx-proxy2-master/conf/conf.d /etc/nginx/ \
    && rm -rf /opt/nginx-setup

# Создаем директорию кэша и даём права
RUN mkdir -p /var/cache/nginx/ip-tv-cache && \
    chown -R nginx:nginx /var
