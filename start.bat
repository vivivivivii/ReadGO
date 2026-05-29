@echo off
chcp 65001 >nul
cd /d "%~dp0"
if not exist node_modules (
  echo 正在安装依赖...
  call npm install
)
if not exist .env (
  copy .env.example .env
  echo 已创建 .env，请填入 DEEPSEEK_API_KEY 后重新运行
  pause
  exit /b 1
)
echo 启动 ReadGO...
start http://localhost:5174
npm run dev
