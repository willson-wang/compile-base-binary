
@echo "Starting Windows build"

echo "开始编译二进制文件"

# 上传多个版本的二进制到私仓
rmdir node_modules

# 安装 grpc，如果二进制不存在，则会走编译流程
call yarn add grpc@1.24.11 || goto :error

# 进入 grpc 的目录
cd .\node_modules\grpc\src\node\extension_binary

ls .

:success

if %errorlevel% neq 0 exit /b %errorlevel%

goto :EOF

:error
exit /b 1