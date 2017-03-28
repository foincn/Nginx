

# 安装依赖
yum -y install gcc gcc-c++  
yum -y install zlib zlib-devel 
yum -y install openssl openssl-devel
yum -y install pcre pcre-devel
yum -y install gd gd-devel
yum -y install autoconf automake make
yum -y install epel-release

# 下载源码
wget -P /home/build http://nginx.org/download/nginx-1.10.3.tar.gz
# 解压
cd /home/build/
tar xf /home/build/nginx-1.10.3.tar.gz -C /home/build
cd /home/build/nginx-1.10.3

# 下载modules
git clone git://github.com/yaoweibin/ngx_http_substitutions_filter_module.git /home/build/subs
# 编译安装
./configure \
  --prefix=/opt/nginx-test \
  --sbin-path=/usr/sbin/nginx \
  --conf-path=/etc/nginx/nginx.conf \
  --error-log-path=/var/log/nginx/error.log \
  --http-log-path=/var/log/nginx/access.log \
  --pid-path=/var/run/nginx/nginx.pid  \
  --lock-path=/var/lock/nginx.lock \
  --user=nginx \
  --group=nginx \
  --http_substitutions_filter_module=/home/build/subs
  --with-http_ssl_module \
  --with-http_stub_status_module #取得一些nginx的运行状态
  --with-pcre \
  --with-file-aio \ 
  --with-http_image_filter_module \
  --with-http_realip_module #支持显示真实来源IP地址
  --http-uwsgi-temp-path=/var/tmp/nginx/uwsgi #设置uwsgi 临时文件路径
  --http-scgi-temp-path=/var/tmp/nginx/scgi #设置scgi 临时文件路径
  --with-debug #允许调试日志


# ./configure  --prefix=/opt/nginx-test --sbin-path=/usr/sbin/nginx --conf-path=/etc/nginx/nginx.conf --error-log-path=/var/log/nginx/error.log --http-log-path=/var/log/nginx/access.log --pid-path=/var/run/nginx/nginx.pid --lock-path=/var/lock/nginx.lock --user=nginx --group=nginx --with-http_ssl_module --with-http_flv_module --with-http_stub_status_module --with-http_gzip_static_module --http-client-body-temp-path=/var/tmp/nginx/client/ --with-pcre --with-file-aio --with-http_image_filter_module --with-http_realip_module

2#./configure --prefix=/opt/nginx-test --sbin-path=/usr/sbin/nginx --conf-path=/etc/nginx/nginx.conf --error-log-path=/var/log/nginx/error.log --http-log-path=/var/log/nginx/access.log --pid-path=/var/run/nginx/nginx.pid --lock-path=/var/lock/nginx.lock --user=nginx --group=nginx   --add-module==/home/build/subs --with-http_ssl_module --with-http_stub_status_module --with-http_realip_module --http-uwsgi-temp-path=/var/tmp/nginx/uwsgi --http-scgi-temp-path=/var/tmp/nginx/scgi




./configure --prefix=/opt/nginx-test   --with-http_ssl_module
make && make install
final ./configure --prefix=/opt/nginx-test --sbin-path=/usr/sbin/nginx --conf-path=/etc/nginx/nginx.conf --error-log-path=/var/log/nginx/error.log --http-log-path=/var/log/nginx/access.log --pid-path=/var/run/nginx/nginx.pid --lock-path=/var/lock/nginx.lock --user=nginx --group=nginx   --add-module=/home/build/subs --with-http_ssl_module --with-http_stub_status_module --with-http_realip_module --http-uwsgi-temp-path=/var/tmp/nginx/uwsgi --http-scgi-temp-path=/var/tmp/nginx/scgi





# 编译安装
./configure
make && make install


# 配置nginx命令
wget -O /etc/init.d/nginx https://gist.github.com/sairam/5892520/raw/b8195a71e944d46271c8a49f2717f70bcd04bf1a/etc-init.d-nginx
sudo chmod +x /etc/init.d/nginx
sudo update-rc.d nginx defaults

nginx start

# reference
# https://xiaozhou.net/compile-nginx-manually-2015-07-23.html
# https://tang.biz/google-every-where.html
# https://my.oschina.net/kcw/blog/318309
# https://www.digitalocean.com/community/tutorials/how-to-compile-nginx-from-source-on-a-centos-6-4-x64-vps
