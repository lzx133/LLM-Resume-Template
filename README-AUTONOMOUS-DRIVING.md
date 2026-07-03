# 自动驾驶算法专家简历

本目录基于 `adongwanai/LLM-Resume-Template` 修改，使用无头像中文模板生成自动驾驶算法专家简历。

## 文件

- `resume-autonomous-driving.tex`：简历内容源文件
- `resume-autonomous-driving.pdf`：投递 PDF
- `Dockerfile`：XeLaTeX 编译环境
- `build-resume.sh`：构建脚本
- `verify-resume.sh`：页数、关键词和模板占位符检查
- `preview/resume-1.png`、`preview/resume-2.png`：视觉预览

## 构建

```bash
./build-resume.sh
```

首次构建会基于本机 Apollo Ubuntu 镜像安装 XeLaTeX 依赖，后续构建使用 Docker 缓存。

## 验证

```bash
./verify-resume.sh
```

验证要求：两页 A4、核心岗位和项目关键词存在、无上游模板示例或占位符。

## 已知信息缺口

当前源材料未包含可用于外发的手机号和邮箱，因此 PDF 中未展示联系方式。获得真实信息后，可在 `\profile{}` 中增加 `\mobile{}` 和 `\email{}`。

## 许可

模板依据 CC BY 4.0 使用并保留上游署名。Font Awesome 字体文件遵循 `fontawesome5/LICENSE.txt` 中的 SIL OFL 1.1 许可。
