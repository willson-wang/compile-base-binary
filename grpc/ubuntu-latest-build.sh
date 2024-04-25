
set -e

uname -m

npm install -g yarn

########################## grpc #############################
echo "开始编译二进制文件"

# 上传多个版本的二进制到私仓
rm -rf node_modules

# 安装 grpc，如果二进制不存在，则会走编译流程
yarn add grpc@1.24.6

# 进入 grpc 的目录
cd ./node_modules/grpc/src/node/extension_binary

ls .

########################## grpc #############################