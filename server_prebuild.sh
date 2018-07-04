#/bin/bash

#usage
# source ./server_prebuild..sh

echo '重要提示: 请不要直接./运行，为了确保其中的环境变量生效，应该使用: source ./server_prebuild.sh'



# 由于danastudio-ants引入了oracle的包，首次编译时，需要针对不同编译平台进行CGO编译环境配置(只需配置一次,无需重复配置)，这里以centos为例：

# 1. Install oracle oci
rpm -ivh oracle-instantclient12.1-basic-12.1.0.2.0-1.x86_64.rpm oracle-instantclient12.1-devel-12.1.0.2.0-1.x86_64.rpm

# 2. 链接oracle依赖库

ln -s /usr/lib/oracle/12.1/client64/lib/libclntsh.so.12.1  /usr/lib64/libclntsh.so.11.1

yes|cp /usr/lib/oracle/12.1/client64/lib/* /usr/lib64/

# 3. 配置编译环境

# export当前目录为$PKG_CONFIG_PATH:

export PKG_CONFIG_PATH=./

# 4. 配置完毕正常编译即可