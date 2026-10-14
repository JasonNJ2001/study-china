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

> ⚠️ **重要：GitHub 已停用「账号密码」做 git 推送**（自 2021 年起），必须用 **Personal Access Token (PAT)**。
> 生成方式：GitHub 网页 → 右上头像 → Settings → Developer settings → Personal access tokens → Tokens (classic)
> → Generate new token (classic) → 勾选 `repo` 全部权限 → 生成并**复制**（只显示一次）。
> 另外：当前 WorkBuddy 沙箱**连不上 github.com**，所以推送必须在你本机（有网的机器）执行。
>
> 站点域名已写死为 `JasonNJ2001.github.io/study-china`（账号 JasonNJ2001，仓库名 study-china），无需再改。

**第一步（本机终端执行，已 git init + commit 就绪，直接加远程并推送）：**

```bash
cd github-pages-site
git remote add origin https://<你的PAT>@github.com/JasonNJ2001/study-china.git
git branch -M main
git push -u origin main
```

> 若还没建远程仓库：先去 github.com 新建仓库 `study-china`（空仓库，不要勾 README），
> 再执行上面三条。也可把 `<你的PAT>` 换成 `JasonNJ2001:<你的PAT>` 形式。

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
