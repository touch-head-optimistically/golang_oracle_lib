

# golang_oracle_lib

golang 与 Oracle client c library 的交叉编译

①server端,可直接用代码目录下的prebuild脚本自动配置环境(source prebuild.danastudio.sh)
②client端，要安装两个rpm包同时复制一些依赖,否则会报错缺少c的依赖



### client端具体操作：

1. Install oracle client

rpm -ivh oracle-instantclient12.1-basic-12.1.0.2.0-1.x86_64.rpm oracle-instantclient12.1-devel-12.1.0.2.0-1.x86_64.rpm


2. 复制依赖

ln -s /usr/lib/oracle/12.1/client64/lib/libclntsh.so.12.1  /usr/lib64/libclntsh.so.11.1

cp /usr/lib/oracle/12.1/client64/lib/* /usr/lib64/


3.ok




### server端 编译时：

首次编译时，需要针对不同编译平台进行CGO编译环境配置(只需配置一次,无需重复配置)，这里以centos为例：

1. Install oracle oci

rpm -ivh oracle-instantclient12.1-basic-12.1.0.2.0-1.x86_64.rpm oracle-instantclient12.1-devel-12.1.0.2.0-1.x86_64.rpm

2. 链接oracle依赖库

  ln -s /usr/lib/oracle/12.1/client64/lib/libclntsh.so.12.1  /usr/lib64/libclntsh.so.11.1

  cp /usr/lib/oracle/12.1/client64/lib/* /usr/lib64/

3. 配置编译环境
   
  export当前目录为$PKG_CONFIG_PATH:
  
  export PKG_CONFIG_PATH=代码目录/build_env
  
4. 配置完毕正常编译即可



Server端的上述步骤可以通过直接运行预编译脚本执行完毕

source ../server_prebuild.sh

