FROM nginx

COPY nginx.conf /etc/nginx/nginx.conf

COPY api.conf     /etc/nginx/conf.d/api.conf
COPY pool-ui.conf /etc/nginx/conf.d/pool-ui.conf

COPY dist /usr/share/nginx/html
