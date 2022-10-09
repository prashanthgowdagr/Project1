apt-get update -y
apt-get upgrade -y

apt install nginx -y

systemctl enable --now nginx

cat > /etc/nginx/conf.d/default.conf <<EOF

server {
        listen 80 default_server;
        listen [::]:80 default_server;
server_name _;

        location / {
                proxy_pass http://localhost:8080;
}
}

EOF

systectl restart nginx
