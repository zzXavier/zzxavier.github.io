# 中文 LaTeX 简历

本目录维护一份科研优先的中文通用简历。个人信息、事实经历与版式分离，后续可以为不同岗位添加入口文件，而无需复制联系方式、教育背景和荣誉信息。

## 目录结构

- `resume-general.tex`：当前通用版入口，决定各模块的展示顺序。
- `style/resume.sty`：A4 单页、颜色、间距、标题、列表和照片布局。
- `content/profile.tex`：姓名、公开链接与照片路径的唯一数据源；敏感字段留空。
- `content/profile-local.example.tex`：本地敏感信息的模板，说明需要覆盖哪些宏。
- `content/*.tex`：教育、优势、科研、项目、荣誉和技能模块。
- `assets/`：证件照所在目录，照片本身不进仓库。
- `tests/Test-Resume.ps1`：不编译 PDF 的静态验收脚本。

## 隐私约定

手机号、邮箱和证件照不进仓库。它们放在 `content/profile-local.tex` 与 `assets/profile-local.jpg`，这两个路径已被 `.gitignore` 忽略；仓库里的 `content/profile.tex` 把对应宏留空，编译时由本地文件覆盖：

```powershell
Copy-Item .\content\profile-local.example.tex .\content\profile-local.tex
```

然后按模板注释填入真实值。缺少本地文件时照样能编译，只是页眉不显示电话和邮箱、照片位置画一个占位框。

静态检查会扫描除 `*local*` 之外的所有 `.tex`/`.sty` 源文件，一旦出现手机号或邮箱格式的字符串就判失败，`*local*` 文件按设计被排除。

## 手动编译

在本目录中运行：

```powershell
xelatex resume-general.tex
```

文档使用 `ctexart`，推荐安装完整的 TeX Live 或 MiKTeX，并使用 XeLaTeX 编译。首次编译后请检查是否保持 A4 单页、照片比例是否正常、中文字体是否可用、链接是否可点击，以及是否存在文字溢出。

编译前请先按「隐私约定」创建 `content/profile-local.tex`，否则生成的 PDF 不含联系方式。

## 静态检查

静态检查不会调用 LaTeX，也不会生成 PDF：

```powershell
powershell.exe -NoProfile -ExecutionPolicy Bypass -File .\tests\Test-Resume.ps1
```

如果已经手动编译并希望保留 PDF 与辅助文件，可在检查时加入 `-AllowBuildArtifacts`。

## 派生岗位版本

1. 复制 `resume-general.tex`，按岗位命名为新的入口文件，例如 `resume-vision.tex` 或 `resume-backend.tex`。
2. 继续引用 `content/profile.tex`、`content/education.tex` 和 `content/honors.tex`，避免重复维护事实信息。
3. 通过调整 `\input{...}` 顺序改变内容优先级；只有岗位确实需要不同措辞时，才新增对应的岗位专属内容模块。
4. 运行静态检查，并在手动编译后复核单页版面。
