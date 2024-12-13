<img src="assets/images/fmv_logo_600x600.png" alt="FMV Logo" width="200" height="200" /><br>
# 💻 Flutter Mold Vault

[![Flutter Version](https://img.shields.io/badge/flutter-3.27.0-blue)](https://flutter.dev)
[![License](https://img.shields.io/badge/license-MIT-green)](LICENSE)

## 📖 Introduction

**Flutter Mold Vault** is a project developed using Dart/Flutter, which provides **reproducibility of code that works in a special way with widgets** to maximize the efficiency of temporal resources in project implementation.

### Key Features
1. This project uses **GetX** for state management and navigation.
2. This project can be built for all supported platforms.
3. This project will be updated in sync with installed packages.
---

## 🚀 Getting Started

### 📋 Prerequisites
Before you begin, ensure you have the following installed:
- Flutter SDK `3.27.0` or higher
- Dart `3.6.0` or higher
---

### 🔧 Installation
1. Install Flutter v3.22.2 (with Chocolatey for Windows)
   1. Execute Powershell (Admin)
   2.  Copy the Powershell command of 'Install Chocolatey for Individual Use' page in  https://chocolatey.org/install
   3. Run the command below
        ```bash
        choco install flutter --version=3.27.0
2. Clone the repository:
   ```bash
   git clone https://github.com/HonkenPark/flutter_mold_vault.git
3. Navigate to the project directory:
    ```bash
   cd flutter_mold_valut
4. Get the dependencies:
   ```bash
   flutter pub get
---

### 📱 Usage
1. Run the app on your desired platform:
   ```bash
   flutter run
2. For web deployment:
   ```bash
   flutter build web --release --no-tree-shake-icons
---

### 🛠️ Technologies Used
- [✅] Flutter
- [✅] Dart
---

### 📄 License
This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
---

### 🗂️ Project Structure
    lib/
    ├── main.dart          # Entry point of the application
    ├── core/models/       # Data models
    ├── core/services/     # Backend or API integrations
    ├── core/viewmodels/   # ViewModels for services
    ├── utils/             # Utility functions and helpers
    ├── views/demo/        # Demo screens for its feature
    └── widgets/           # Reusable widgets
---
