# Workspace Rules - Musly Veyino Edition

## Build & Environment Hygiene Rules

1. **Clean Rebuild Pattern (编译时全新下载依赖)**:
   - 在开始 Release / 生产环境编译之前，确保拉取最新依赖并清理过往构建脏缓存：
     ```bash
     flutter clean
     flutter pub get
     ```

2. **Post-Release Disk Space Reclamation (发行版发布后彻底清理释放 SSD)**:
   - 每次完成 Release 发行包编译并验证、打包或提交之后，必须立即清理所有中间构建产物、依赖缓存与 Gradle 守护进程缓存，防止磁盘持续膨胀：
     ```bash
     # 1. 停止 Gradle 守护进程，释放内存锁
     cd android && ./gradlew --stop && cd ..
     # 2. 清理 Flutter / Android 本地构建中间物
     flutter clean
     # 3. 清理 Gradle 变换与临时缓存 (只保留 wrapper jar，清理 transforms 和 build-cache)
     rm -rf ~/.gradle/caches/transforms-* ~/.gradle/caches/jars-* ~/.gradle/caches/build-cache-* ~/.gradle/daemon/
     # 4. 清理 Android 模块下的中间 build 目录
     rm -rf android/build/ android/app/build/ android/.gradle/
     ```

3. **Asset Protection**:
   - 生成的正式 Release 安装包（如 `musly-v*-release.apk`）存放于工作区根目录供分发，同时确认受 `.gitignore` 保护，严禁将 APK/AAB 或密钥证书文件（`*.keystore`, `*.jks`, `key.properties`）提交到 Git。
