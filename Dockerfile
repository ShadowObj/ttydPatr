FROM debian:sid
WORKDIR /data
EXPOSE 80
RUN apt update -y > /dev/null 2>&1\
 && apt install -y nginx
COPY nginx.conf /etc/nginx/nginx.conf
COPY ttyd.x86_64 /data/ttyd
CMD nginx\
 && nohup /data/ttyd.x86_64 -p 8888 -b /ttyd -c $TTYDUSER:$TTYDTOKEN "/bin/bash" > /dev/null 2>&1
