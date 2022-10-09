apt-get update -y
apt-get upgrade -y

apt install nginx -y

systemctl enable --now nginx
systemctl status nginx
cat > /etc/nginx/conf.d/sites-enabled/default <<EOF

server {
        listen 80 default_server;
        listen [::]:80 default_server;
server_name _;

        location / {
                proxy_pass http://localhost:8080;
}
}

EOF

systemctl restart nginx
