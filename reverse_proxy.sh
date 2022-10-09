apt-get update -y
apt-get upgrade -y

apt install nginx -y

rm -rf /etc/nginx/conf.d/default.conf

cat > /etc/nginx/sites-enabled/default <<EOF
server {
        listen 80 default_server;
        listen [::]:80 default_server;
server_name _;

        location / {
                proxy_pass http://localhost:8080;
}
}
EOF

systemctl enable --now nginx
systemctl status nginx
systemctl restart nginx
