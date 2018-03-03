FROM nginx

COPY nginx.conf /etc/nginx/nginx.conf

# UI + API on separate ports
# COPY api.conf     /etc/nginx/conf.d/api.conf
# COPY pool-ui.conf /etc/nginx/conf.d/pool-ui.conf

# On port 80 both UI + API
COPY pool-ui-api.conf /etc/nginx/conf.d/pool-ui-api.conf

COPY dist /usr/share/nginx/html
