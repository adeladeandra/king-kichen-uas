# King Chicken Flutter 项目

## 项目概述

King Chicken 是一个全新的 Flutter 应用项目，目前处于初始开发阶段。这是一个标准的 Flutter 应用程序，使用 Material Design 设计语言，支持多平台部署（iOS、Android、Web、Windows、macOS、Linux）。

### 技术栈
- **框架**: Flutter (Dart)
- **SDK版本**: ^3.9.2
- **UI库**: Material Design
- **图标库**: Cupertino Icons (iOS 风格图标)
- **测试框架**: Flutter Test

### 项目结构
```
lib/
├── main.dart                 # 应用入口文件
test/
├── widget_test.dart          # 基础组件测试
android/                      # Android 平台配置
ios/                          # iOS 平台配置
web/                          # Web 平台配置
windows/                      # Windows 平台配置
macos/                        # macOS 平台配置
linux/                        # Linux 平台配置
```

## 构建和运行

### 基本命令
```bash
# 获取依赖
flutter pub get

# 运行应用（调试模式）
flutter run

# 运行应用（指定平台）
flutter run -d chrome          # Web
flutter run -d macos           # macOS
flutter run -d windows         # Windows

# 构建应用
flutter build apk              # Android APK
flutter build ios              # iOS
flutter build web              # Web
flutter build windows          # Windows
flutter build macos            # macOS
flutter build linux            # Linux

# 运行测试
flutter test

# 代码分析
flutter analyze
```

### 开发环境设置
1. 确保已安装 Flutter SDK (版本 >= 3.9.2)
2. 配置相应平台的开发环境（Xcode for iOS, Android Studio for Android）
3. 运行 `flutter doctor` 检查环境配置

## 开发规范

### 代码风格
- 遵循 Dart 官方代码规范
- 使用 `flutter_lints` 包进行代码检查
- 代码格式化：`dart format .`
- 代码分析：`flutter analyze`

### 测试规范
- 使用 `flutter_test` 框架进行单元测试和组件测试
- 测试文件放在 `test/` 目录下
- 测试文件命名：`*_test.dart`
- 运行测试：`flutter test`

### 项目约定
- 使用 Material Design 组件和主题
- 遵循 Flutter 响应式设计原则
- 使用 StatefulWidget 处理动态状态
- 优先使用 const 构造函数优化性能

## 当前功能

应用目前包含 Flutter 默认的计数器示例：
- 主页面显示计数器值
- 浮动操作按钮用于增加计数
- 基础的 Material Design 界面布局

## 开发指南

### 添加新功能
1. 在 `lib/` 目录下创建新的功能模块
2. 遵循 Flutter 组件开发最佳实践
3. 为新功能编写相应的测试用例
4. 运行 `flutter analyze` 确保代码质量

### 依赖管理
- 在 `pubspec.yaml` 中添加新的依赖包
- 运行 `flutter pub get` 获取新依赖
- 优先使用 Flutter 官方和社区维护的包

### 资源管理
- 图片资源放在 `assets/` 目录下（需在 `pubspec.yaml` 中配置）
- 字体资源放在 `fonts/` 目录下（需在 `pubspec.yaml` 中配置）

## 版本信息
- 版本号: 1.0.0+1
- 构建号: 1