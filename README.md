# 🛠️ Công cụ Cấu hình SSH

![Version](https://img.shields.io/badge/version-1.0.0-blue)
![Platform](https://img.shields.io/badge/platform-Windows%20%7C%20macOS%20%7C%20Linux-lightgrey)
![Language](https://img.shields.io/badge/language-Bash%20%7C%20Batch-brightgreen)
![License](https://img.shields.io/badge/license-MIT-green)

<div align="center">
  <a href="#vietnamese">Tiếng Việt</a> | <a href="#english">English</a>
</div>

---

<div id="vietnamese">

# Công cụ Cấu hình SSH (Tiếng Việt)

Công cụ quản lý SSH key, cấu hình Git và khóa bảo mật đa nền tảng

## 🌟 Tính năng

- **Hỗ trợ đa ngôn ngữ**

  - Tiếng Việt
  - Tiếng Anh
  - Chuyển đổi ngôn ngữ dễ dàng

- **Tương thích đa nền tảng**

  - Windows
  - macOS
  - Linux

- **Các loại SSH Key**

  - 🔐 ed25519 (Được khuyến nghị)
  - 🔑 RSA
  - 🔒 ECDSA
  - ⚠️ DSA
  - 🗝️ YubiKey
  - 🔐 FIDO2 Security Keys (ed25519-sk, ecdsa-sk)

- **Cấu hình Git**

  - 👤 Tên và email toàn cục
  - 🔗 URL kho lưu trữ
  - 🔄 Cấu hình lại dễ dàng

- **Tính năng bảo mật**
  - 🔒 Khóa bảo mật phần cứng
  - 🔐 Xác thực hai yếu tố
  - 🛡️ Bảo vệ chống trộm

## 🚀 Bắt đầu nhanh

### Yêu cầu hệ thống

- Bash shell
- OpenSSH client
- Git
- Cho khóa bảo mật:
  - YubiKey 4 trở lên
  - Phần mềm YubiKey Manager
  - Thiết bị tương thích FIDO2/U2F

### Cài đặt

#### macOS

```bash
# Tải và chạy script cài đặt
curl -O https://raw.githubusercontent.com/kieth1205/ssh-keygen-scripts/master/macos_setup.sh
chmod +x macos_setup.sh
./macos_setup.sh
```

#### Windows

```powershell
# Tải script cài đặt
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/kieth1205/ssh-keygen-scripts/master/windows_setup.bat" -OutFile "windows_setup.bat"

# Chạy cài đặt
.\windows_setup.bat
```

#### Linux

```bash
# Tải và chạy script cài đặt
curl -O https://raw.githubusercontent.com/kieth1205/ssh-keygen-scripts/master/linux_setup.sh
chmod +x linux_setup.sh
./linux_setup.sh
```

## 💻 Sử dụng

### Các lệnh cơ bản

| Lệnh               | Mô tả                         |
| ------------------ | ----------------------------- |
| `setup_ssh`        | Chạy script cài đặt đầy đủ    |
| `git_setup_global` | Cấu hình cài đặt Git toàn cục |
| `git_setup_urls`   | Cấu hình URL kho lưu trữ Git  |
| `git_show_config`  | Hiển thị cấu hình hiện tại    |

### So sánh các loại SSH Key

| Loại    | Bảo mật    | Hiệu suất  | Tương thích | Khuyến nghị |
| ------- | ---------- | ---------- | ----------- | ----------- |
| ed25519 | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐    | ✅          |
| RSA     | ⭐⭐⭐⭐   | ⭐⭐⭐     | ⭐⭐⭐⭐⭐  | ⚠️          |
| ECDSA   | ⭐⭐⭐⭐   | ⭐⭐⭐⭐   | ⭐⭐⭐⭐    | ⚠️          |
| DSA     | ⭐⭐       | ⭐⭐       | ⭐⭐⭐      | ❌          |
| YubiKey | ⭐⭐⭐⭐⭐ | ⭐⭐⭐     | ⭐⭐⭐      | ✅          |
| FIDO2   | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐   | ⭐⭐⭐      | ✅          |

## 🔧 Cấu hình

### Chọn ngôn ngữ

Công cụ sẽ yêu cầu chọn ngôn ngữ khi khởi động:

1. Tiếng Việt
2. Tiếng Anh

### Tạo SSH Key

1. Chọn loại key
2. Nhập số lượng tài khoản
3. Cấu hình tên tài khoản
4. Đặt URL Git (tùy chọn)

### Cấu hình Git

1. Đặt tên và email toàn cục
2. Cấu hình URL kho lưu trữ
3. Kiểm tra kết nối SSH

## 🛠️ Xử lý sự cố

### Các vấn đề thường gặp

1. **Không tìm thấy script**

   ```bash
   # Kiểm tra PATH
   echo $PATH

   # Xác minh vị trí script
   ls ~/scripts/setup_ssh.sh
   ```

2. **Từ chối quyền**

   ```bash
   # Sửa quyền
   chmod +x ~/scripts/setup_ssh.sh
   ```

3. **Không phát hiện khóa bảo mật**
   - Kiểm tra kết nối thiết bị
   - Xác minh cài đặt driver
   - Kiểm tra bằng `ykman info`

### Nhận trợ giúp

Đối với vấn đề hoặc câu hỏi:

1. Kiểm tra phần xử lý sự cố
2. Xác minh yêu cầu hệ thống
3. Đảm bảo cài đặt đúng cách

</div>

---

<div id="english">

# SSH Setup Tool (English)

A multi-platform tool for managing SSH keys, Git configurations, and security keys

## 🌟 Features

- **Multi-language Support**

  - English
  - Vietnamese
  - Easy language switching

- **Cross-platform Compatibility**

  - Windows
  - macOS
  - Linux

- **SSH Key Types**

  - 🔐 ed25519 (Recommended)
  - 🔑 RSA
  - 🔒 ECDSA
  - ⚠️ DSA
  - 🗝️ YubiKey
  - 🔐 FIDO2 Security Keys (ed25519-sk, ecdsa-sk)

- **Git Configuration**

  - 👤 Global name and email
  - 🔗 Repository URLs
  - 🔄 Easy reconfiguration

- **Security Features**
  - 🔒 Hardware security keys
  - 🔐 Two-factor authentication
  - 🛡️ Theft protection

## 🚀 Quick Start

### Prerequisites

- Bash shell
- OpenSSH client
- Git
- For security keys:
  - YubiKey 4 or later
  - YubiKey Manager software
  - FIDO2/U2F compatible device

### Installation

#### macOS

```bash
# Download and run setup script
curl -O https://raw.githubusercontent.com/kieth1205/ssh-keygen-scripts/master/macos_setup.sh
chmod +x macos_setup.sh
./macos_setup.sh
```

#### Windows

```powershell
# Download setup script
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/kieth1205/ssh-keygen-scripts/master/windows_setup.bat" -OutFile "windows_setup.bat"

# Run setup
.\windows_setup.bat
```

#### Linux

```bash
# Download and run setup script
curl -O https://raw.githubusercontent.com/kieth1205/ssh-keygen-scripts/master/linux_setup.sh
chmod +x linux_setup.sh
./linux_setup.sh
```

## 💻 Usage

### Basic Commands

| Command            | Description                   |
| ------------------ | ----------------------------- |
| `setup_ssh`        | Run the full setup script     |
| `git_setup_global` | Configure Git global settings |
| `git_setup_urls`   | Configure Git repository URLs |
| `git_show_config`  | Show current configuration    |

### SSH Key Types Comparison

| Type    | Security   | Performance | Compatibility | Recommended |
| ------- | ---------- | ----------- | ------------- | ----------- |
| ed25519 | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐  | ⭐⭐⭐⭐      | ✅          |
| RSA     | ⭐⭐⭐⭐   | ⭐⭐⭐      | ⭐⭐⭐⭐⭐    | ⚠️          |
| ECDSA   | ⭐⭐⭐⭐   | ⭐⭐⭐⭐    | ⭐⭐⭐⭐      | ⚠️          |
| DSA     | ⭐⭐       | ⭐⭐        | ⭐⭐⭐        | ❌          |
| YubiKey | ⭐⭐⭐⭐⭐ | ⭐⭐⭐      | ⭐⭐⭐        | ✅          |
| FIDO2   | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐    | ⭐⭐⭐        | ✅          |

## 🔧 Configuration

### Language Selection

The tool will prompt for language selection at startup:

1. Vietnamese
2. English

### SSH Key Generation

1. Choose key type
2. Enter number of accounts
3. Configure account names
4. Set Git URLs (optional)

### Git Configuration

1. Set global name and email
2. Configure repository URLs
3. Test SSH connections

## 🛠️ Troubleshooting

### Common Issues

1. **Script not found**

   ```bash
   # Check PATH
   echo $PATH

   # Verify script location
   ls ~/scripts/setup_ssh.sh
   ```

2. **Permission denied**

   ```bash
   # Fix permissions
   chmod +x ~/scripts/setup_ssh.sh
   ```

3. **Security key not detected**
   - Check device connection
   - Verify driver installation
   - Test with `ykman info`

### Getting Help

For issues or questions:

1. Check the troubleshooting section
2. Verify system requirements
3. Ensure proper installation

</div>

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🤝 Contributing

1. Fork the repository
2. Create your feature branch
3. Commit your changes
4. Push to the branch
5. Create a Pull Request

## 📞 Support

For support, please:

- Open an issue
- Check the documentation
- Contact the maintainers

---

Made with ❤️ by MediKoGPT Team
