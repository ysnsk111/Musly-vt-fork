# Musly (Veyino Edition) 🎵

<div align="center">

[![License: CC BY-NC-SA 4.0](https://img.shields.io/badge/开源协议-CC%20BY--NC--SA%204.0-blue.svg?style=flat-square)](https://creativecommons.org/licenses/by-nc-sa/4.0/deed.zh-hans)
[![Flutter](https://img.shields.io/badge/Flutter-3.x-02569B?style=flat-square&logo=flutter&logoColor=white)](https://flutter.dev)
[![Release](https://img.shields.io/badge/版本-v2.1.0-orange?style=flat-square&logo=github)](https://github.com/ysnsk111/Musly/releases)
[![Platform](https://img.shields.io/badge/支持平台-Android%20%7C%20iOS%20%7C%20Desktop-brightgreen?style=flat-square)](https://github.com/ysnsk111/Musly)
[![Architecture](https://img.shields.io/badge/架构-arm64--v8a%20%7C%20armeabi--v7a%20%7C%20x86__64-purple?style=flat-square)](https://github.com/ysnsk111/Musly/releases)
[![Team](https://img.shields.io/badge/维护团队-Veyino%20Team-6366F1?style=flat-square)](https://veyino.org)

**一款优雅、现代化且纯粹的跨平台音乐流媒体播放器，支持 Navidrome、Subsonic、Jellyfin、Emby 及本地音乐。**

[English](README.md) • [简体中文](README_zh.md) • [团队官网](https://veyino.org) • [Releases 下载](https://github.com/ysnsk111/Musly/releases)

</div>

---

## 🌟 Veyino Edition (v2.1.0) 核心更新特性

本分支是由 **Veyino 团队** (`ysnsk111`) 基于原项目 [Musly (作者 dddevid)](https://github.com/dddevid/Musly) 独立维护的深度优化版本，专为追求极致音质与流畅体验的音乐爱好者打造：

- 📱 **真·全面屏手势沉浸适配**：系统状态栏与底部手势导航条全局半透明融入，完美契合曲面屏及各类现代 Android 设备手势。
- 💧 **iOS / FlClash 灵动水滴指示滑块底栏**：告别原版生硬的图标变色，采用类似 iOS 及新版 FlClash Android 的平滑水滴指示胶囊滑块，配合清脆轻震触感反馈与纯变色算法，既美观灵动又杜绝液态玻璃的高功耗发热。
- 🎶 **交互式跟手下拉收起动画**：正在播放全屏界面支持跟手垂直下拉手势，位移、缩放比例、圆角变化与阻尼弹簧回弹一体化呈现，展开与收起顺滑自然。
- 🛡️ **智能底栏自适应隐藏**：进入「设置」等深层页面时，底部导航栏与迷你播放条自动平滑隐藏，彻底解决遮挡设置选项及保存按钮的问题。
- 🎛️ **Salt Player（椒盐音乐）级专业播放控制**：
  - 音质角标展示（Hi-Res、无损 FLAC、高码率标识）
  - 0.5x 至 2.0x 无级播放倍速调节
  - 歌词时间轴微调（±0.1s / ±0.5s）
  - 自定义快进/快退步长（5s、10s、15s、30s）
  - 睡眠定时器与细腻触感反馈开关
- 📴 **更完备的离线模式支持**：当断网或无法连接流媒体服务器时，自动无缝切入离线模式，状态栏清晰标注离线状态，并提供一键「重试」实时探测恢复在线同步，而非粗暴展示错误页。
- 🌏 **100% 深度中文及多语言本地化**：完整、地道的简体中文与繁体中文翻译，告别半汉化体验。
- 🚫 **100% 纯净无打扰**：彻底移除原版所有捐赠弹窗、30分钟计时赞助提示、Revolut 链接与第三方推广，纯粹专注音乐。

---

## 🎵 支持的音乐源与流媒体服务

- **Navidrome** - [navidrome.org](https://www.navidrome.org/)
- **Subsonic / Airsonic / Gonic** - [subsonic.org](http://www.subsonic.org/)
- **Jellyfin 与 Emby** - [jellyfin.org](https://jellyfin.org/) / [emby.media](https://emby.media/)
- **全球网络电台与直播流** (Radio Browser API 与自定义流地址)
- **本地音乐文件** (支持 MP3, FLAC, AAC, WAV, OGG, OPUS, M4A 等全格式解码)

---

## 📦 安装包下载与架构说明

前往 [Releases 发行页面](https://github.com/ysnsk111/Musly/releases) 即可直接下载已自签名的 APK 文件：

| 架构 / 文件名 | 说明 | 适用机型 |
| :--- | :--- | :--- |
| **`app-arm64-v8a-release.apk`** | 64 位 ARM 原生架构 | 绝大多数现代 Android 智能手机与平板（首选） |
| **`app-armeabi-v7a-release.apk`** | 32 位老旧 ARM 架构 | 早期老款手机、低功耗电视盒子 |
| **`app-x86_64-release.apk`** | 64 位 Intel/AMD 架构 | Android 模拟器、ChromeOS、x86 设备 |
| **`musly-veyino-release.apk`** | 通用整合版 | 全架构通用兼容安装包 |

---

## 🛠️ 源码编译指南

### 编译环境要求
- Flutter SDK `>= 3.10.0`
- Android SDK (API 34 / NDK) 与 Java 17

### 快速构建指令
```bash
# 克隆仓库
git clone https://github.com/ysnsk111/Musly.git
cd Musly

# 获取依赖
flutter pub get

# 针对各架构分包编译 Release 版本
flutter build apk --release --split-per-abi
```

---

## 👥 Veyino 团队联系与支持

- **团队官网**：[veyino.org](https://veyino.org)
- **GitHub 主页**：[@ysnsk111](https://github.com/ysnsk111)
- **团队邮箱**：`veyinotm@gmail.com`
- **支持咨询**：`support@veyino.org`

---

## 📄 开源许可证与署名说明

> [!IMPORTANT]
> **本软件为非商业开源软件。严禁将本应用二次打包上传至 Google Play 等任何商业软件商店。**

- 本项目遵循 **知识共享 署名-非商业性使用-相同方式共享 4.0 国际许可协议 (CC BY-NC-SA 4.0)** 开源。完整条款详见 [LICENSE](LICENSE) 文件。
- **原作者与来源声明**：本项目基于原开源项目 [Musly](https://github.com/dddevid/Musly)（原作者：[dddevid](https://github.com/dddevid)）进行维护与扩展，严格遵守原许可协议进行非商业化开发与共享。
