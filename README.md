# ReadGO

个人藏书管理与 DeepSeek 智能导书平台。

## 功能

- 账号登录，每个账号独立书架
- 瀑布流书架，支持按阅读标签筛选（想读 / 未读 / 阅读中 / 已读）
- 书籍信息编辑：封面、书名、分类、作者、推荐理由、来源、备注、评价
- **导书 GO**：输入书名、网页链接，或上传 Excel / Word，由 DeepSeek 自动生成书籍信息
- 聊天记录按账号保存 7 天，跨设备同步

## 技术栈

- 前端：Vite + 原生 JavaScript
- 后端：Node.js + Express
- 数据库：SQLite（better-sqlite3）
- AI：DeepSeek API

## 快速开始

### 环境要求

- Node.js 18+
- DeepSeek API Key（[platform.deepseek.com](https://platform.deepseek.com)）

### 安装

```bash
# 克隆仓库
git clone https://github.com/你的用户名/readgo.git
cd readgo

# 安装依赖
npm install

# 配置环境变量
cp .env.example .env
# 编辑 .env，填入 DEEPSEEK_API_KEY
```

### 开发运行

```bash
npm run dev
```

- 前端：http://localhost:5174
- 后端：http://localhost:3456

Windows 用户也可双击 `start.bat` 一键启动。

### 生产部署

```bash
npm run build
npm start
```

**推荐平台**：Render、Railway、Fly.io 等支持 **长期运行 Node 进程 + 磁盘持久化** 的服务。

| 平台 | 是否适合 | 说明 |
|------|----------|------|
| Render / Railway / Docker | ✅ | 使用仓库内 `Dockerfile` 或 `render.yaml` |
| Vercel / Netlify 静态托管 | ❌ | 本项目是 Express + SQLite，不适合 Serverless |

**环境变量**（在平台控制台配置，不要提交 `.env`）：

- `DEEPSEEK_API_KEY`（必填）
- `JWT_SECRET`（必填，随机长字符串）
- `PORT`（多数平台自动注入，无需手动设置）
- `NODE_ENV=production`

**构建命令**：`npm install && npm run build`  
**启动命令**：`npm start`

若日志里只有黄色的 `npm warn deprecated`，一般**不是失败原因**；真正常见问题是 `better-sqlite3` 原生模块编译失败——请使用 **Node 20** 并优先用 Docker 部署。

仓库已包含 `Dockerfile`，Render 可直接选 Docker 部署。

### ⚠️ 不要用 Vercel 部署完整版

Vercel 只能托管**静态网页**，无法运行本项目的 Express 后端与 SQLite 数据库。  
在 Vercel 上即使构建成功，登录、书架、导书 GO 等 API 也会全部失败。

**请改用 [Render](https://render.com)**（免费档可用）：

1. [render.com](https://render.com) → New → **Web Service** → 连接 `vivivivivii/ReadGO`
2. **Environment** 选 **Docker**
3. 环境变量：`DEEPSEEK_API_KEY`、`JWT_SECRET`
4. 添加 **Disk**：Mount Path = `/app/data`，1 GB
5. 部署完成后打开 Render 提供的网址

若你已在 Vercel 创建了项目，可在 Vercel 控制台 **删除该项目**，避免每次 push 都自动失败。

## 环境变量

| 变量 | 说明 | 默认值 |
|------|------|--------|
| `DEEPSEEK_API_KEY` | DeepSeek API 密钥 | 必填 |
| `DEEPSEEK_BASE_URL` | API 地址 | `https://api.deepseek.com` |
| `DEEPSEEK_MODEL` | 模型名称 | `deepseek-chat` |
| `PORT` | 后端端口 | `3456` |
| `JWT_SECRET` | 登录令牌密钥 | 生产环境务必修改 |

## 项目结构

```
readgo/
├── frontend/          # 前端页面与样式
│   ├── index.html     # 登录页
│   ├── app.html       # 书架主页
│   ├── css/
│   └── js/
├── server/            # 后端 API
│   ├── index.js
│   ├── db.js
│   ├── auth.js
│   ├── deepseek.js
│   └── documentParser.js
├── public/covers/     # 默认书籍封面
├── data/              # SQLite 数据库（运行时自动创建）
├── uploads/           # 用户上传文件（运行时自动创建）
├── .env.example
├── package.json
└── vite.config.js
```

## 上传到 GitHub

```bash
cd readgo
git init
git add .
git commit -m "Initial commit: ReadGO"
git branch -M main
git remote add origin https://github.com/你的用户名/readgo.git
git push -u origin main
```

> 注意：`.env` 已在 `.gitignore` 中排除，不会上传密钥。请勿将 API Key 提交到仓库。

## License

MIT
