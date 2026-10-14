# Study in China Guide — GitHub Pages 静态站

面向 Google / 海外生源的英文留学指南站，由 ORIGIN 尚源教育维护。
收录极好、零成本、可脚本部署，是「A 类·自有资产」中除主站外的独立获客阵地。

## 文件结构
```
github-pages-site/
├── index.html                  # 枢纽首页
├── how-to-study-in-china.html  # 申请步骤
├── csc-scholarship-2027.html   # CSC 奖学金 2027
├── top-universities-china.html # 院校推荐
├── china-student-visa.html     # 学生签证
├── assets/style.css
├── sitemap.xml
├── robots.txt
└── README.md
```
每页已含：`<title>` / `meta description` / `canonical` / Open Graph / Twitter Card / JSON-LD Article，
内链互通，并回链 `https://www.originedu.net`（主站外链权重）。

## 一键部署到 GitHub Pages

### 实测环境结论（2026-10-14 验证）
| 项 | 状态 | 说明 |
|---|---|---|
| `github.com` **直连** | ❌ 不通 | 超时（换美国 IP 亦超时） |
| `github.com` **经系统代理** | ✅ 200 | 走 `http://127.0.0.1:5780`（Windows 系统代理）即可 |
| `api.github.com` 直连 | ✅ 200 | 可绕开代理直连 |
| 远程仓库 | ✅ 已存在 | `JasonNJ2001/study-china`（空仓、公开、默认分支 main） |
| 本地仓库 | ✅ 就绪 | 已 `git init` + 提交，分支已重命名为 `main` |
| 剩余卡点 | ⚠️ token 权限 | 旧 PAT 报 `Permission to … denied`，缺 `Contents: Read and write` |

> ⚠️ **GitHub 已停用「账号密码」做 git 推送**（2021 年起），必须用 **Personal Access Token (PAT)**。

### A. 最省事：修好 PAT 权限后跑一键脚本
1. **修 token 权限**（30 秒）：打开 <https://github.com/settings/personal-access-tokens> → 点你那个 token → 
   - Repository access：确认 **包含 `study-china`**（或选 All repositories）
   - Repository permissions → **Contents → Read and write**
   - Save
2. 双击本目录下的 **`deploy-push.bat`**，按提示粘贴 token（不会写入任何文件），自动完成推送。

### B. 手动命令（cmd / Git Bash 均可）
```bash
cd D:/Myprograms/互联网推广/github-pages-site
git -c http.proxy=http://127.0.0.1:5780 -c https.proxy=http://127.0.0.1:5780 \
    push "https://<你的PAT>@github.com/JasonNJ2001/study-china.git" main:main
```
> 代理必须加，否则连不上 github.com；token 建议用 **classic + `repo` 权限**（最不容易踩坑）。
> 也可长期配置：`git config --global http.proxy http://127.0.0.1:5780`（换网络环境后记得改回）。

**第二步（GitHub 网页）：**
进入该仓库 **Settings → Pages → Source 选 `main` 分支 / root 目录 → Save**。
约 1–2 分钟后访问 `https://JasonNJ2001.github.io/study-china/`。

## 让 Google 更快收录
1. 部署后到 <https://search.google.com/search-console> 添加该站点并验证。
2. 在 Search Console 里提交 `sitemap.xml` 地址。
3. 可在 <https://www.bing.com/webmasters> 同步提交（Bing 也覆盖 Yahoo）。

## 注意（反垃圾红线）
- 全站为原创英文价值内容，不机翻堆砌、不互链农场，符合 Google 收录规范。
- 回链仅指向主站 `originedu.net`，数量克制（每页 1 处），避免被判定链接操纵。
- 更新内容后重新 `git push` 即可，Search Console 会自动重新抓取。
