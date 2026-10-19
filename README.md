# Musly (Veyino Edition) 🎵

<div align="center">

[![License: CC BY-NC-SA 4.0](https://img.shields.io/badge/License-CC%20BY--NC--SA%204.0-blue.svg?style=flat-square)](https://creativecommons.org/licenses/by-nc-sa/4.0/)
[![Flutter](https://img.shields.io/badge/Flutter-3.x-02569B?style=flat-square&logo=flutter&logoColor=white)](https://flutter.dev)
[![Release](https://img.shields.io/badge/Release-v2.1.0-orange?style=flat-square&logo=github)](https://github.com/ysnsk111/Musly-vt-fork/releases)
[![Platform](https://img.shields.io/badge/Platform-Android%20%7C%20iOS%20%7C%20Desktop-brightgreen?style=flat-square)](https://github.com/ysnsk111/Musly-vt-fork)
[![Architecture](https://img.shields.io/badge/ABI-arm64--v8a%20%7C%20armeabi--v7a%20%7C%20x86__64-purple?style=flat-square)](https://github.com/ysnsk111/Musly-vt-fork/releases)
[![Team](https://img.shields.io/badge/Maintained%20by-Veyino%20Team-6366F1?style=flat-square)](https://veyino.org)

**A refined, modern, and pure music streaming client for Navidrome, Subsonic, Jellyfin, Emby, and local files.**

[English](README.md) • [简体中文](README_zh.md) • [Team Website](https://veyino.org) • [Releases](https://github.com/ysnsk111/Musly-vt-fork/releases)

</div>

---

## 🌟 What's New in Veyino Edition (v2.1.0)

This is an enhanced community fork of [Musly (original by dddevid)](https://github.com/dddevid/Musly) independently maintained by the **Veyino Team** (`ysnsk111`), focused on polished animations, complete edge-to-edge system adaptation, a clean user experience, and professional playback controls:

- 📱 **True Edge-to-Edge Adaptation**: Seamless immersive status and navigation bar integration with edge gesture compatibility.
- 💧 **iOS / FlClash Fluid Droplet Bottom Bar**: Responsive animated pill droplet slider inspired by iOS and FlClash Android design, featuring haptic feedback and pure dynamic coloring without energy-draining glass filters.
- 🎶 **Interactive Drag-to-Dismiss Gesture**: Smooth interactive vertical pull-down dismiss gesture for the full-screen player with live offset translation, scaling, rounded-corner morphing, and elastic spring-back.
- 🛡️ **Intelligent Bottom Bar Auto-Hiding**: Bottom navigation bar and MiniPlayer automatically hide when browsing Settings, eliminating bottom content clipping and occlusion.
- 🎛️ **Salt Player Grade Audio Controls**: Hi-Res/Lossless quality badges, playback speed controls (0.5x - 2.0x), lyric timeline offset micro-tuning (±0.1s/0.5s), customizable seek intervals, and sleep timer.
- 📴 **Robust Offline Fallback**: Automatic offline mode entry upon connection loss with prominent status banner and one-tap reconnection retry.
- 🌏 **100% Comprehensive Localization**: Complete, natural Simplified Chinese (zh-Hans), Traditional Chinese, and multi-language support.
- 🚫 **100% Clean & Pure Experience**: Completely removed all donation prompts, timed usage dialogs, Revolut links, and third-party sponsored popups.

---

## 🎵 Supported Music Sources & Media Servers

- **Navidrome** - [navidrome.org](https://www.navidrome.org/)
- **Subsonic / Airsonic / Gonic** - [subsonic.org](http://www.subsonic.org/)
- **Jellyfin & Emby** - [jellyfin.org](https://jellyfin.org/) / [emby.media](https://emby.media/)
- **Web Streams & Live Radio** (Radio Browser API & custom stream URLs)
- **Local Audio Files** (MP3, FLAC, AAC, WAV, OGG, OPUS, M4A)

---

## 📦 Download & Releases

Download signed Android APKs directly from the [Releases](https://github.com/ysnsk111/Musly-vt-fork/releases) page:

| Architecture / Package | Description | Recommended For |
| :--- | :--- | :--- |
| **`app-arm64-v8a-release.apk`** | 64-bit ARM architecture | 99% of modern Android smartphones & tablets |
| **`app-armeabi-v7a-release.apk`** | 32-bit legacy ARM architecture | Older devices and lightweight TV boxes |
| **`app-x86_64-release.apk`** | 64-bit Intel/AMD architecture | Android emulators, ChromeOS, x86 devices |
| **`musly-veyino-release.apk`** | Universal bundle package | All compatible Android devices |

---

## 🛠️ Build from Source

### Prerequisites
- Flutter SDK `>= 3.10.0`
- Android SDK (API 34 / NDK) & Java 17

### Commands
```bash
# Clone the repository
git clone https://github.com/ysnsk111/Musly-vt-fork.git
cd Musly

# Fetch dependencies
flutter pub get

# Build Release APK (Per-ABI split packages)
flutter build apk --release --split-per-abi
```

---

## 👥 Veyino Team & Community

- **Official Website**: [veyino.org](https://veyino.org)
- **GitHub Maintainer**: [@ysnsk111](https://github.com/ysnsk111)
- **Email Contact**: `veyinotm@gmail.com`
- **Support & Inquiries**: `support@veyino.org`

---

## 📄 License & Attribution

> [!IMPORTANT]
> **This application is non-commercial software. DO NOT redistribute this app to commercial app stores.**

- This project is licensed under the **Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International (CC BY-NC-SA 4.0)** License. See the [LICENSE](LICENSE) file for complete terms.
- **Upstream Project Attribution**: This repository is a community-maintained fork of [Musly](https://github.com/dddevid/Musly) originally created by [dddevid](https://github.com/dddevid).
