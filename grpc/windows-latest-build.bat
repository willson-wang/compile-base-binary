
@echo "Starting Windows build"

echo "开始编译二进制文件"

call npm config set msvs-version 2022 || goto :error
call npm config set msvs_version 2022 || goto :error
call echo 'GYP_MSVS_VERSION=2022' >> $Env:GITHUB_ENV || goto :error

call npm config list || goto :error


# 上传多个版本的二进制到私仓
rmdir node_modules

# 安装 grpc，如果二进制不存在，则会走编译流程
call yarn add @mapbox/node-pre-gyp grpc@1.24.11 --ignore-scripts || goto :error

# 进入 grpc 的目录
cd .\node_modules\grpc

@REM call yarn node-pre-gyp install --library=static_library --build-from-source || goto :error
call yarn node-pre-gyp configure build package --target=%VERSION% --target_arch=%ARCH% --runtime=%RUNTIME% && goto :success

cd .\src\node\extension_binary\node-v93-win32-x64-unknown

ls .

:success

if %errorlevel% neq 0 exit /b %errorlevel%

goto :EOF

:error
exit /b 1