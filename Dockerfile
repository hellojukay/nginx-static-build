FROM ubuntu:18.04
ADD sources.list /etc/apt/
RUN apt-get update  -y && apt-get install wget libxslt1-dev libxml2-dev zlib1g-dev libpcre3-dev libbz2-dev libssl-dev make -y
WORKDIR /tmp/
COPY nginx-1.22.0.tar.gz /tmp/nginx-1.22.0.tar.gz
COPY openssl-1.0.1e.tar.gz /tmp/openssl-1.0.1e.tar.gz
RUN tar -xf nginx-1.22.0.tar.gz && cd nginx-1.22.0 && cp ../openssl-1.0.1e.tar.gz . && tar xf openssl-1.0.1e.tar.gz && ./configure --conf-path=/etc/nginx/nginx.conf --prefix=/etc/nginx --with-cc-opt="-static -static-libgcc" \
            --with-ld-opt="-static" --with-cpu-opt=generic --with-pcre \
            --with-mail --with-ipv6 --with-poll_module --with-select_module \
            --with-select_module --with-poll_module \
            --with-http_ssl_module --with-http_realip_module \
            --with-http_addition_module --with-http_sub_module --with-http_dav_module \
            --with-http_flv_module --with-http_mp4_module --with-http_gunzip_module \
            --with-http_gzip_static_module --with-http_auth_request_module \
            --with-http_random_index_module --with-http_secure_link_module \
            --with-http_degradation_module --with-http_stub_status_module \
            --with-mail --with-mail_ssl_module --with-openssl=./openssl-1.0.1e &&  make -j1 && cp objs/nginx /bin/ -f



