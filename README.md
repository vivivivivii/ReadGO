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
