#!/bin/bash
#
# 🔧 SSH Setup Tool
# 🚀 Main configuration script for SSH key management

# Colors for output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
BOLD='\033[1m'
ITALIC='\033[3m'
NC='\033[0m' # No Color

# Language selection
echo -e "${GREEN}Select language / Chọn ngôn ngữ:${NC}"
echo "1) English"
echo "2) Tiếng Việt"
read -p "Enter your choice [1]: " lang_choice
lang_choice=${lang_choice:-1}

# Function to get text based on language
get_text() {
    local key=$1
    shift
    local text
    
    if [[ "$lang_choice" == "2" ]]; then
        case "$key" in
            "menu_title") text="Menu Cấu hình Git và SSH" ;;
            "menu_ssh") text="Cấu hình SSH keys và hosts" ;;
            "menu_git_global") text="Cấu hình Git global name và email" ;;
            "menu_git_urls") text="Cấu hình Git repository URLs" ;;
            "menu_show_config") text="Hiển thị cấu hình hiện tại" ;;
            "menu_exit") text="Thoát" ;;
            "menu_prompt") text="Nhập lựa chọn của bạn [1-5]: " ;;
            "invalid_choice") text="Lựa chọn không hợp lệ. Vui lòng thử lại." ;;
            "exiting") text="Đang thoát..." ;;
            "unsupported_os") text="Hệ điều hành không được hỗ trợ" ;;
            "ssh_start") text="Bắt đầu cấu hình SSH..." ;;
            "ssh_key_type") text="Chọn loại SSH key:" ;;
            "ssh_key_ed25519") text="ed25519 (Được khuyến nghị)" ;;
            "ssh_key_ed25519_desc") text="ed25519 - Thuật toán mới nhất, bảo mật cao, hiệu suất tốt, key ngắn" ;;
            "ssh_key_ed25519_pros") text="Ưu điểm: Bảo mật cao, key ngắn, hiệu suất tốt, được khuyến nghị sử dụng" ;;
            "ssh_key_ed25519_cons") text="Nhược điểm: Không tương thích với một số hệ thống cũ" ;;
            "ssh_key_ed25519_sk") text="ed25519-sk (Khóa bảo mật FIDO2)" ;;
            "ssh_key_ed25519_sk_desc") text="ed25519-sk - Khóa bảo mật FIDO2, yêu cầu thiết bị phần cứng" ;;
            "ssh_key_ed25519_sk_pros") text="Ưu điểm: Bảo mật cao nhất, chống mất cắp, xác thực 2 yếu tố" ;;
            "ssh_key_ed25519_sk_cons") text="Nhược điểm: Cần thiết bị phần cứng, không tương thích với một số hệ thống" ;;
            "ssh_key_ed25519_sk_required") text="Yêu cầu: Thiết bị FIDO2/U2F (YubiKey, Google Titan Key, v.v.)" ;;
            "ssh_key_ed25519_sk_setup") text="Thiết lập khóa bảo mật FIDO2:" ;;
            "ssh_key_ed25519_sk_setup_1") text="1. Cắm thiết bị bảo mật vào máy tính" ;;
            "ssh_key_ed25519_sk_setup_2") text="2. Chạy lệnh: ssh-keygen -t ed25519-sk -C 'your-comment'" ;;
            "ssh_key_ed25519_sk_setup_3") text="3. Nhấn nút trên thiết bị khi được yêu cầu" ;;
            "ssh_key_ed25519_sk_setup_4") text="4. Nhập PIN nếu được yêu cầu" ;;
            "ssh_key_ecdsa_sk") text="ecdsa-sk (Khóa bảo mật FIDO2)" ;;
            "ssh_key_ecdsa_sk_desc") text="ecdsa-sk - Khóa bảo mật FIDO2 dựa trên ECDSA, yêu cầu thiết bị phần cứng" ;;
            "ssh_key_ecdsa_sk_pros") text="Ưu điểm: Bảo mật cao, tương thích rộng rãi với các thiết bị FIDO2" ;;
            "ssh_key_ecdsa_sk_cons") text="Nhược điểm: Cần thiết bị phần cứng, hiệu suất thấp hơn ed25519-sk" ;;
            "ssh_key_ecdsa_sk_required") text="Yêu cầu: Thiết bị FIDO2/U2F (YubiKey, Google Titan Key, v.v.)" ;;
            "ssh_key_ecdsa_sk_setup") text="Thiết lập khóa bảo mật FIDO2 ECDSA:" ;;
            "ssh_key_ecdsa_sk_setup_1") text="1. Cắm thiết bị bảo mật vào máy tính" ;;
            "ssh_key_ecdsa_sk_setup_2") text="2. Chạy lệnh: ssh-keygen -t ecdsa-sk -C 'your-comment'" ;;
            "ssh_key_ecdsa_sk_setup_3") text="3. Nhấn nút trên thiết bị khi được yêu cầu" ;;
            "ssh_key_ecdsa_sk_setup_4") text="4. Nhập PIN nếu được yêu cầu" ;;
            "ssh_key_rsa") text="RSA (Phổ biến)" ;;
            "ssh_key_rsa_desc") text="RSA - Thuật toán phổ biến, tương thích rộng rãi" ;;
            "ssh_key_rsa_pros") text="Ưu điểm: Tương thích rộng rãi, được hỗ trợ bởi hầu hết các hệ thống" ;;
            "ssh_key_rsa_cons") text="Nhược điểm: Key dài, hiệu suất thấp hơn ed25519" ;;
            "ssh_key_ecdsa") text="ECDSA (Nhanh)" ;;
            "ssh_key_ecdsa_desc") text="ECDSA - Thuật toán dựa trên đường cong elliptic, hiệu suất tốt" ;;
            "ssh_key_ecdsa_pros") text="Ưu điểm: Hiệu suất tốt, key ngắn, bảo mật cao" ;;
            "ssh_key_ecdsa_cons") text="Nhược điểm: Có thể có vấn đề về bảo mật nếu không sử dụng đúng đường cong" ;;
            "ssh_key_dsa") text="DSA (Cũ)" ;;
            "ssh_key_dsa_desc") text="DSA - Thuật toán cũ, không còn được khuyến nghị" ;;
            "ssh_key_dsa_pros") text="Ưu điểm: Tương thích với các hệ thống rất cũ" ;;
            "ssh_key_dsa_cons") text="Nhược điểm: Không an toàn, không được khuyến nghị sử dụng" ;;
            "ssh_key_yubikey") text="YubiKey (Khóa vật lý)" ;;
            "ssh_key_yubikey_desc") text="YubiKey - Khóa bảo mật vật lý, yêu cầu thiết bị phần cứng" ;;
            "ssh_key_yubikey_pros") text="Ưu điểm: Bảo mật cao nhất, chống mất cắp, có thể sử dụng cho nhiều dịch vụ" ;;
            "ssh_key_yubikey_cons") text="Nhược điểm: Cần mang theo thiết bị, giá thành cao, cần cài đặt thêm phần mềm" ;;
            "ssh_key_yubikey_required") text="Yêu cầu: YubiKey 4 trở lên, phần mềm YubiKey Manager" ;;
            "ssh_key_yubikey_install") text="Cài đặt YubiKey Manager:" ;;
            "ssh_key_yubikey_install_linux") text="Linux: sudo apt install yubikey-manager" ;;
            "ssh_key_yubikey_install_macos") text="macOS: brew install yubikey-manager" ;;
            "ssh_key_yubikey_install_windows") text="Windows: Tải từ https://www.yubico.com/support/download/yubikey-manager/" ;;
            "ssh_key_yubikey_setup") text="Thiết lập YubiKey:" ;;
            "ssh_key_yubikey_setup_1") text="1. Cắm YubiKey vào máy tính" ;;
            "ssh_key_yubikey_setup_2") text="2. Chạy lệnh: ykman openpgp info" ;;
            "ssh_key_yubikey_setup_3") text="3. Tạo key mới: ykman openpgp generate-key" ;;
            "ssh_key_yubikey_setup_4") text="4. Xuất public key: ykman openpgp export" ;;
            "ssh_num_accounts") text="Nhập số lượng tài khoản:" ;;
            "ssh_invalid_num") text="Vui lòng nhập số hợp lệ lớn hơn 0" ;;
            "ssh_account") text="Tài khoản" ;;
            "ssh_account_name") text="Nhập tên tài khoản" ;;
            "ssh_account_desc") text="Nhập mô tả tài khoản" ;;
            "ssh_key_exists") text="SSH key cho %s đã tồn tại." ;;
            "ssh_generate_new") text="Bạn có muốn tạo key mới không? (y/n) [n]: " ;;
            "ssh_using_existing") text="Sử dụng SSH key hiện có cho %s." ;;
            "ssh_generating") text="Đang tạo SSH key cho %s..." ;;
            "ssh_host_exists") text="Host %s đã tồn tại trong SSH config." ;;
            "ssh_update_config") text="Bạn có muốn cập nhật cấu hình không? (y/n) [n]: " ;;
            "ssh_keeping_config") text="Giữ nguyên cấu hình SSH cho %s." ;;
            "ssh_adding_keys") text="Đang thêm SSH keys vào agent..." ;;
            "ssh_setup_complete") text="Cấu hình hoàn tất! Đây là các public keys để thêm vào GitHub:" ;;
            "ssh_test_connection") text="Để kiểm tra kết nối, chạy lệnh:" ;;
            "git_global_start") text="Đang cấu hình Git global..." ;;
            "git_global_name") text="Nhập Git global name" ;;
            "git_global_email") text="Nhập Git global email" ;;
            "git_global_updated") text="Đã cập nhật cấu hình Git global:" ;;
            "git_global_exists") text="Cấu hình Git global đã được thiết lập:" ;;
            "git_global_reconfigure") text="Bạn có muốn cấu hình lại Git global không? (y/n) [n]: " ;;
            "git_urls_start") text="Đang cấu hình Git repository URLs..." ;;
            "git_urls_no_config") text="Không tìm thấy file SSH config. Vui lòng cấu hình SSH trước." ;;
            "git_urls_no_hosts") text="Chưa có SSH hosts nào được cấu hình. Vui lòng cấu hình SSH trước." ;;
            "git_urls_host") text="Cho host: %s" ;;
            "git_urls_path") text="Nhập đường dẫn repository (ví dụ: username/repo):" ;;
            "git_urls_set") text="Đã cấu hình Git URL cho %s thành: %s" ;;
            "git_urls_exists") text="Git URLs đã được cấu hình." ;;
            "git_urls_reconfigure") text="Bạn có muốn cấu hình lại Git URLs không? (y/n) [n]: " ;;
            "config_title") text="Cấu hình hiện tại:" ;;
            "config_ssh_hosts") text="SSH Hosts:" ;;
            "config_no_hosts") text="Chưa có SSH hosts nào được cấu hình" ;;
            "config_git_global") text="Cấu hình Git Global:" ;;
            "config_not_configured") text="Chưa được cấu hình" ;;
            "config_git_urls") text="Git Repository URLs:" ;;
            "config_no_config") text="Không tìm thấy file SSH config" ;;
        esac
    else
        case "$key" in
            "menu_title") text="Git and SSH Configuration Menu" ;;
            "menu_ssh") text="Configure SSH keys and hosts" ;;
            "menu_git_global") text="Set Git global name and email" ;;
            "menu_git_urls") text="Configure Git repository URLs" ;;
            "menu_show_config") text="Show current configuration" ;;
            "menu_exit") text="Exit" ;;
            "menu_prompt") text="Enter your choice [1-5]: " ;;
            "invalid_choice") text="Invalid choice. Please try again." ;;
            "exiting") text="Exiting..." ;;
            "unsupported_os") text="Unsupported operating system" ;;
            "ssh_start") text="Starting SSH configuration..." ;;
            "ssh_key_type") text="Select SSH key type:" ;;
            "ssh_key_ed25519") text="ed25519 (Recommended)" ;;
            "ssh_key_ed25519_desc") text="ed25519 - Latest algorithm, high security, good performance, short key" ;;
            "ssh_key_ed25519_pros") text="Pros: High security, short key, good performance, recommended" ;;
            "ssh_key_ed25519_cons") text="Cons: Not compatible with some older systems" ;;
            "ssh_key_ed25519_sk") text="ed25519-sk (FIDO2 Security Key)" ;;
            "ssh_key_ed25519_sk_desc") text="ed25519-sk - FIDO2 security key, requires hardware device" ;;
            "ssh_key_ed25519_sk_pros") text="Pros: Highest security, theft protection, two-factor authentication" ;;
            "ssh_key_ed25519_sk_cons") text="Cons: Requires hardware device, not compatible with some systems" ;;
            "ssh_key_ed25519_sk_required") text="Requirements: FIDO2/U2F device (YubiKey, Google Titan Key, etc.)" ;;
            "ssh_key_ed25519_sk_setup") text="Setup FIDO2 security key:" ;;
            "ssh_key_ed25519_sk_setup_1") text="1. Insert security device into computer" ;;
            "ssh_key_ed25519_sk_setup_2") text="2. Run: ssh-keygen -t ed25519-sk -C 'your-comment'" ;;
            "ssh_key_ed25519_sk_setup_3") text="3. Press button on device when prompted" ;;
            "ssh_key_ed25519_sk_setup_4") text="4. Enter PIN if required" ;;
            "ssh_key_ecdsa_sk") text="ecdsa-sk (FIDO2 Security Key)" ;;
            "ssh_key_ecdsa_sk_desc") text="ecdsa-sk - FIDO2 security key based on ECDSA, requires hardware device" ;;
            "ssh_key_ecdsa_sk_pros") text="Pros: High security, wide compatibility with FIDO2 devices" ;;
            "ssh_key_ecdsa_sk_cons") text="Cons: Requires hardware device, lower performance than ed25519-sk" ;;
            "ssh_key_ecdsa_sk_required") text="Requirements: FIDO2/U2F device (YubiKey, Google Titan Key, etc.)" ;;
            "ssh_key_ecdsa_sk_setup") text="Setup FIDO2 ECDSA security key:" ;;
            "ssh_key_ecdsa_sk_setup_1") text="1. Insert security device into computer" ;;
            "ssh_key_ecdsa_sk_setup_2") text="2. Run: ssh-keygen -t ecdsa-sk -C 'your-comment'" ;;
            "ssh_key_ecdsa_sk_setup_3") text="3. Press button on device when prompted" ;;
            "ssh_key_ecdsa_sk_setup_4") text="4. Enter PIN if required" ;;
            "ssh_key_rsa") text="RSA (Common)" ;;
            "ssh_key_rsa_desc") text="RSA - Common algorithm, wide compatibility" ;;
            "ssh_key_rsa_pros") text="Pros: Wide compatibility, supported by most systems" ;;
            "ssh_key_rsa_cons") text="Cons: Long key, lower performance than ed25519" ;;
            "ssh_key_ecdsa") text="ECDSA (Fast)" ;;
            "ssh_key_ecdsa_desc") text="ECDSA - Elliptic curve based algorithm, good performance" ;;
            "ssh_key_ecdsa_pros") text="Pros: Good performance, short key, high security" ;;
            "ssh_key_ecdsa_cons") text="Cons: May have security issues if wrong curve is used" ;;
            "ssh_key_dsa") text="DSA (Legacy)" ;;
            "ssh_key_dsa_desc") text="DSA - Old algorithm, no longer recommended" ;;
            "ssh_key_dsa_pros") text="Pros: Compatible with very old systems" ;;
            "ssh_key_dsa_cons") text="Cons: Not secure, not recommended for use" ;;
            "ssh_key_yubikey") text="YubiKey (Physical Key)" ;;
            "ssh_key_yubikey_desc") text="YubiKey - Physical security key, requires hardware device" ;;
            "ssh_key_yubikey_pros") text="Pros: Highest security, theft protection, multi-service support" ;;
            "ssh_key_yubikey_cons") text="Cons: Need to carry device, higher cost, requires additional software" ;;
            "ssh_key_yubikey_required") text="Requirements: YubiKey 4 or later, YubiKey Manager software" ;;
            "ssh_key_yubikey_install") text="Install YubiKey Manager:" ;;
            "ssh_key_yubikey_install_linux") text="Linux: sudo apt install yubikey-manager" ;;
            "ssh_key_yubikey_install_macos") text="macOS: brew install yubikey-manager" ;;
            "ssh_key_yubikey_install_windows") text="Windows: Download from https://www.yubico.com/support/download/yubikey-manager/" ;;
            "ssh_key_yubikey_setup") text="Setup YubiKey:" ;;
            "ssh_key_yubikey_setup_1") text="1. Insert YubiKey into computer" ;;
            "ssh_key_yubikey_setup_2") text="2. Run: ykman openpgp info" ;;
            "ssh_key_yubikey_setup_3") text="3. Tạo key mới: ykman openpgp generate-key" ;;
            "ssh_key_yubikey_setup_4") text="4. Xuất public key: ykman openpgp export" ;;
            "ssh_num_accounts") text="Enter number of accounts:" ;;
            "ssh_invalid_num") text="Please enter a valid number greater than 0" ;;
            "ssh_account") text="Account" ;;
            "ssh_account_name") text="Enter account name" ;;
            "ssh_account_desc") text="Enter account description" ;;
            "ssh_key_exists") text="SSH key for %s already exists." ;;
            "ssh_generate_new") text="Do you want to generate a new key? (y/n) [n]: " ;;
            "ssh_using_existing") text="Using existing SSH key for %s." ;;
            "ssh_generating") text="Generating SSH key for %s..." ;;
            "ssh_host_exists") text="Host %s already exists in SSH config." ;;
            "ssh_update_config") text="Do you want to update the configuration? (y/n) [n]: " ;;
            "ssh_keeping_config") text="Keeping existing SSH config for %s." ;;
            "ssh_adding_keys") text="Adding SSH keys to agent..." ;;
            "ssh_setup_complete") text="Setup completed! Here are your public keys to add to GitHub:" ;;
            "ssh_test_connection") text="To test the connection, run:" ;;
            "git_global_start") text="Setting Git global configuration..." ;;
            "git_global_name") text="Enter your Git global name" ;;
            "git_global_email") text="Enter your Git global email" ;;
            "git_global_updated") text="Git global configuration updated:" ;;
            "git_global_exists") text="Git global configuration is already set:" ;;
            "git_global_reconfigure") text="Do you want to reconfigure Git global settings? (y/n) [n]: " ;;
            "git_urls_start") text="Setting Git URLs for repositories..." ;;
            "git_urls_no_config") text="No SSH config file found. Please configure SSH first." ;;
            "git_urls_no_hosts") text="No SSH hosts configured. Please configure SSH first." ;;
            "git_urls_host") text="For host: %s" ;;
            "git_urls_path") text="Enter repository path (e.g., username/repo):" ;;
            "git_urls_set") text="Set Git URL for %s to: %s" ;;
            "git_urls_exists") text="Git URLs are already configured." ;;
            "git_urls_reconfigure") text="Do you want to reconfigure Git URLs? (y/n) [n]: " ;;
            "config_title") text="Current Configuration:" ;;
            "config_ssh_hosts") text="SSH Hosts:" ;;
            "config_no_hosts") text="No SSH hosts configured" ;;
            "config_git_global") text="Git Global Configuration:" ;;
            "config_not_configured") text="Not configured" ;;
            "config_git_urls") text="Git Repository URLs:" ;;
            "config_no_config") text="No SSH config file found" ;;
        esac
    fi
    
    printf "$text" "$@"
}

# Function to show key type information
show_key_info() {
    local key_type=$1
    echo -e "\n${YELLOW}$(get_text "ssh_key_${key_type}_desc")${NC}"
    echo -e "${GREEN}$(get_text "ssh_key_${key_type}_pros")${NC}"
    echo -e "${RED}$(get_text "ssh_key_${key_type}_cons")${NC}"
    
    if [[ "$key_type" == "yubikey" ]]; then
        echo -e "\n${GREEN}$(get_text "ssh_key_yubikey_required")${NC}"
        echo -e "\n${YELLOW}$(get_text "ssh_key_yubikey_install")${NC}"
        case "$OS" in
            "linux") echo "$(get_text "ssh_key_yubikey_install_linux")" ;;
            "macos") echo "$(get_text "ssh_key_yubikey_install_macos")" ;;
            "windows") echo "$(get_text "ssh_key_yubikey_install_windows")" ;;
        esac
        echo -e "\n${YELLOW}$(get_text "ssh_key_yubikey_setup")${NC}"
        echo "$(get_text "ssh_key_yubikey_setup_1")"
        echo "$(get_text "ssh_key_yubikey_setup_2")"
        echo "$(get_text "ssh_key_yubikey_setup_3")"
        echo "$(get_text "ssh_key_yubikey_setup_4")"
    elif [[ "$key_type" == "ed25519_sk" || "$key_type" == "ecdsa_sk" ]]; then
        echo -e "\n${GREEN}$(get_text "ssh_key_${key_type}_required")${NC}"
        echo -e "\n${YELLOW}$(get_text "ssh_key_${key_type}_setup")${NC}"
        echo "$(get_text "ssh_key_${key_type}_setup_1")"
        echo "$(get_text "ssh_key_${key_type}_setup_2")"
        echo "$(get_text "ssh_key_${key_type}_setup_3")"
        echo "$(get_text "ssh_key_${key_type}_setup_4")"
    fi
}

# Detect OS
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    OS="linux"
elif [[ "$OSTYPE" == "darwin"* ]]; then
    OS="macos"
elif [[ "$OSTYPE" == "msys" || "$OSTYPE" == "win32" ]]; then
    OS="windows"
else
    echo -e "${YELLOW}$(get_text "unsupported_os")${NC}"
    exit 1
fi

# Function to get user input with default value
get_input() {
    local prompt="$1"
    local default="$2"
    local input
    
    read -p "$prompt [$default]: " input
    echo "${input:-$default}"
}

# Function to sanitize filename (remove special characters)
sanitize_filename() {
    if [[ "$OS" == "windows" ]]; then
        echo "$1" | tr -dc '[:alnum:]'
    else
        echo "$1" | sed 's/[^a-zA-Z0-9]//g'
    fi
}

# Function to set file permissions
set_permissions() {
    local file="$1"
    if [[ "$OS" != "windows" ]]; then
        chmod "$2" "$file"
    fi
}

# Function to check if SSH key exists
check_ssh_key() {
    local safe_filename=$1
    local key_type=$2
    if [[ "$OS" == "windows" ]]; then
        if [ -f "$USERPROFILE/.ssh/id_${key_type}_${safe_filename}" ] && [ -f "$USERPROFILE/.ssh/id_${key_type}_${safe_filename}.pub" ]; then
            echo "true"
        else
            echo "false"
        fi
    else
        if [ -f ~/.ssh/id_${key_type}_${safe_filename} ] && [ -f ~/.ssh/id_${key_type}_${safe_filename}.pub ]; then
            echo "true"
        else
            echo "false"
        fi
    fi
}

# Function to check if host exists in config
check_host_in_config() {
    local host=$1
    local config_file
    if [[ "$OS" == "windows" ]]; then
        config_file="$USERPROFILE/.ssh/config"
    else
        config_file=~/.ssh/config
    fi
    
    if [ -f "$config_file" ] && grep -q "Host $host$" "$config_file"; then
        echo "true"
    else
        echo "false"
    fi
}

# Function to get SSH directory path
get_ssh_dir() {
    if [[ "$OS" == "windows" ]]; then
        echo "$USERPROFILE/.ssh"
    else
        echo ~/.ssh
    fi
}

# Function to get SSH config file path
get_ssh_config() {
    echo "$(get_ssh_dir)/config"
}

# Function to set Git global config
set_git_global_config() {
    echo -e "\n${YELLOW}$(get_text "git_global_start")${NC}"
    
    # Get current values
    current_name=$(git config --global user.name)
    current_email=$(git config --global user.email)
    
    # Get new values
    git_name=$(get_input "$(get_text "git_global_name")" "$current_name")
    git_email=$(get_input "$(get_text "git_global_email")" "$current_email")
    
    # Set new values
    git config --global user.name "$git_name"
    git config --global user.email "$git_email"
    
    echo -e "${GREEN}$(get_text "git_global_updated")${NC}"
    echo "Name: $(git config --global user.name)"
    echo "Email: $(git config --global user.email)"
    
    # Store the configuration
    local ssh_dir=$(get_ssh_dir)
    echo "$git_name" > "$ssh_dir/git_global_name"
    echo "$git_email" > "$ssh_dir/git_global_email"
}

# Function to configure SSH
configure_ssh() {
    echo -e "${GREEN}$(get_text "ssh_start")${NC}"
    
    # Get SSH key type
    echo -e "${YELLOW}$(get_text "ssh_key_type")${NC}"
    echo "${BOLD}1) $(get_text "ssh_key_ed25519")${NC}"
    echo "   ${GREEN}$(get_text "ssh_key_ed25519_pros")${NC}"
    echo "   ${RED}$(get_text "ssh_key_ed25519_cons")${NC}"
    echo ""
    echo "${BOLD}2) $(get_text "ssh_key_rsa")${NC}"
    echo "   ${GREEN}$(get_text "ssh_key_rsa_pros")${NC}"
    echo "   ${RED}$(get_text "ssh_key_rsa_cons")${NC}"
    echo ""
    echo "${BOLD}3) $(get_text "ssh_key_ecdsa")${NC}"
    echo "   ${GREEN}$(get_text "ssh_key_ecdsa_pros")${NC}"
    echo "   ${RED}$(get_text "ssh_key_ecdsa_cons")${NC}"
    echo ""
    echo "${BOLD}4) $(get_text "ssh_key_dsa")${NC}"
    echo "   ${GREEN}$(get_text "ssh_key_dsa_pros")${NC}"
    echo "   ${RED}$(get_text "ssh_key_dsa_cons")${NC}"
    echo ""
    echo "${BOLD}5) $(get_text "ssh_key_yubikey")${NC}"
    echo "   ${GREEN}$(get_text "ssh_key_yubikey_pros")${NC}"
    echo "   ${RED}$(get_text "ssh_key_yubikey_cons")${NC}"
    echo ""
    echo "${BOLD}6) $(get_text "ssh_key_ed25519_sk")${NC}"
    echo "   ${GREEN}$(get_text "ssh_key_ed25519_sk_pros")${NC}"
    echo "   ${RED}$(get_text "ssh_key_ed25519_sk_cons")${NC}"
    echo ""
    echo "${BOLD}7) $(get_text "ssh_key_ecdsa_sk")${NC}"
    echo "   ${GREEN}$(get_text "ssh_key_ecdsa_sk_pros")${NC}"
    echo "   ${RED}$(get_text "ssh_key_ecdsa_sk_cons")${NC}"
    read -p "$(get_text "menu_prompt")" key_type
    key_type=${key_type:-1}

    case $key_type in
        1) 
            key_type="ed25519"
            ;;
        2) 
            key_type="rsa"
            ;;
        3) 
            key_type="ecdsa"
            ;;
        4) 
            key_type="dsa"
            ;;
        5)
            key_type="yubikey"
            echo -e "\n${GREEN}$(get_text "ssh_key_yubikey_required")${NC}"
            echo -e "\n${YELLOW}$(get_text "ssh_key_yubikey_install")${NC}"
            case "$OS" in
                "linux") echo "$(get_text "ssh_key_yubikey_install_linux")" ;;
                "macos") echo "$(get_text "ssh_key_yubikey_install_macos")" ;;
                "windows") echo "$(get_text "ssh_key_yubikey_install_windows")" ;;
            esac
            echo -e "\n${YELLOW}$(get_text "ssh_key_yubikey_setup")${NC}"
            echo "$(get_text "ssh_key_yubikey_setup_1")"
            echo "$(get_text "ssh_key_yubikey_setup_2")"
            echo "$(get_text "ssh_key_yubikey_setup_3")"
            echo "$(get_text "ssh_key_yubikey_setup_4")"
            echo -e "\n${YELLOW}Please follow the instructions above to set up your YubiKey.${NC}"
            echo -e "${YELLOW}After setup, press Enter to continue...${NC}"
            read
            ;;
        6)
            key_type="ed25519_sk"
            echo -e "\n${GREEN}$(get_text "ssh_key_ed25519_sk_required")${NC}"
            echo -e "\n${YELLOW}$(get_text "ssh_key_ed25519_sk_setup")${NC}"
            echo "$(get_text "ssh_key_ed25519_sk_setup_1")"
            echo "$(get_text "ssh_key_ed25519_sk_setup_2")"
            echo "$(get_text "ssh_key_ed25519_sk_setup_3")"
            echo "$(get_text "ssh_key_ed25519_sk_setup_4")"
            echo -e "\n${YELLOW}Please follow the instructions above to set up your FIDO2 security key.${NC}"
            echo -e "${YELLOW}After setup, press Enter to continue...${NC}"
            read
            ;;
        7)
            key_type="ecdsa_sk"
            echo -e "\n${GREEN}$(get_text "ssh_key_ecdsa_sk_required")${NC}"
            echo -e "\n${YELLOW}$(get_text "ssh_key_ecdsa_sk_setup")${NC}"
            echo "$(get_text "ssh_key_ecdsa_sk_setup_1")"
            echo "$(get_text "ssh_key_ecdsa_sk_setup_2")"
            echo "$(get_text "ssh_key_ecdsa_sk_setup_3")"
            echo "$(get_text "ssh_key_ecdsa_sk_setup_4")"
            echo -e "\n${YELLOW}Please follow the instructions above to set up your FIDO2 security key.${NC}"
            echo -e "${YELLOW}After setup, press Enter to continue...${NC}"
            read
            ;;
        *) 
            key_type="ed25519"
            ;;
    esac

    # Get number of accounts
    read -p "$(get_text "ssh_num_accounts")" num_accounts
    while [[ ! "$num_accounts" =~ ^[1-9][0-9]*$ ]]; do
        echo "$(get_text "ssh_invalid_num")"
        read -p "$(get_text "ssh_num_accounts")" num_accounts
    done

    # Create .ssh directory if it doesn't exist
    local ssh_dir=$(get_ssh_dir)
    mkdir -p "$ssh_dir"
    set_permissions "$ssh_dir" 700

    # Create SSH config if it doesn't exist
    local config_file=$(get_ssh_config)
    if [ ! -f "$config_file" ]; then
        touch "$config_file"
        set_permissions "$config_file" 600
    fi

    # Arrays to store account information
    declare -a account_names
    declare -a account_descs
    declare -a safe_filenames

    # Generate SSH keys and create config for each account
    for ((i=1; i<=num_accounts; i++)); do
        echo -e "\n${YELLOW}$(get_text "ssh_account") $i:${NC}"
        account_name=$(get_input "$(get_text "ssh_account_name")" "account$i")
        account_desc=$(get_input "$(get_text "ssh_account_desc")" "$account_name")
        
        # Store account information
        account_names[$i]=$account_name
        account_descs[$i]=$account_desc
        safe_filenames[$i]=$(sanitize_filename "$account_name")
        
        # Check if SSH key already exists
        if [ "$(check_ssh_key "${safe_filenames[$i]}" "$key_type")" = "true" ]; then
            echo -e "${YELLOW}$(get_text "ssh_key_exists" "${account_descs[$i]}")${NC}"
            read -p "$(get_text "ssh_generate_new")" generate_new
            if [[ "$generate_new" =~ ^[Yy]$ ]]; then
                # Generate new SSH key
                echo -e "${YELLOW}$(get_text "ssh_generating" "$account_name")${NC}"
                ssh-keygen -t $key_type -C "$account_desc" -f "$ssh_dir/id_${key_type}_${safe_filenames[$i]}" -N ""
            else
                echo -e "${GREEN}$(get_text "ssh_using_existing" "${account_descs[$i]}")${NC}"
            fi
        else
            # Generate SSH key
            echo -e "${YELLOW}$(get_text "ssh_generating" "$account_name")${NC}"
            ssh-keygen -t $key_type -C "$account_desc" -f "$ssh_dir/id_${key_type}_${safe_filenames[$i]}" -N ""
        fi
        
        # Check if host already exists in config
        if [ "$(check_host_in_config "$account_name")" = "true" ]; then
            echo -e "${YELLOW}$(get_text "ssh_host_exists" "$account_name")${NC}"
            read -p "$(get_text "ssh_update_config")" update_config
            if [[ "$update_config" =~ ^[Yy]$ ]]; then
                # Remove existing host configuration
                if [[ "$OS" == "windows" ]]; then
                    # Windows doesn't have sed, use alternative method
                    temp_file=$(mktemp)
                    awk -v host="$account_name" '
                        BEGIN { skip=0 }
                        /^Host / { if ($2 == host) skip=1; else skip=0 }
                        !skip { print }
                        /^$/ && skip { skip=0 }
                    ' "$config_file" > "$temp_file"
                    mv "$temp_file" "$config_file"
                else
                    sed -i.bak "/^Host $account_name$/,/^$/d" "$config_file"
                fi
                # Add new configuration
                cat >> "$config_file" << EOL

# $account_desc
Host $account_name
    HostName github.com
    User git
    IdentityFile $ssh_dir/id_${key_type}_${safe_filenames[$i]}
EOL
            else
                echo -e "${GREEN}$(get_text "ssh_keeping_config" "$account_name")${NC}"
            fi
        else
            # Add new configuration
            cat >> "$config_file" << EOL

# $account_desc
Host $account_name
    HostName github.com
    User git
    IdentityFile $ssh_dir/id_${key_type}_${safe_filenames[$i]}
EOL
        fi
    done

    # Start SSH agent and add keys
    echo -e "${YELLOW}$(get_text "ssh_adding_keys")${NC}"
    if [[ "$OS" == "windows" ]]; then
        # Windows specific SSH agent handling
        if ! pgrep -x "ssh-agent" > /dev/null; then
            eval "$(ssh-agent -s)"
        fi
    else
        eval "$(ssh-agent -s)"
    fi

    # Add all keys to agent
    for ((i=1; i<=num_accounts; i++)); do
        ssh-add "$ssh_dir/id_${key_type}_${safe_filenames[$i]}"
    done

    # Display public keys
    echo -e "${GREEN}$(get_text "ssh_setup_complete")${NC}"
    for ((i=1; i<=num_accounts; i++)); do
        echo -e "\n${YELLOW}$(get_text "ssh_account") ${account_descs[$i]}:${NC}"
        echo -e "${ITALIC}$(cat "$ssh_dir/id_${key_type}_${safe_filenames[$i]}.pub")${NC}"
    done

    echo -e "\n${GREEN}$(get_text "ssh_test_connection")${NC}"
    for ((i=1; i<=num_accounts; i++)); do
        echo -e "${BOLD}ssh -T git@${account_names[$i]}${NC}"
    done
}

# Function to set Git URLs
set_git_urls() {
    echo -e "\n${YELLOW}$(get_text "git_urls_start")${NC}"
    
    local config_file=$(get_ssh_config)
    local ssh_dir=$(get_ssh_dir)
    
    # Get list of configured hosts
    if [ ! -f "$config_file" ]; then
        echo -e "${YELLOW}$(get_text "git_urls_no_config")${NC}"
        return
    fi
    
    hosts=($(grep "^Host " "$config_file" | awk '{print $2}'))
    
    if [ ${#hosts[@]} -eq 0 ]; then
        echo -e "${YELLOW}$(get_text "git_urls_no_hosts")${NC}"
        return
    fi
    
    for host in "${hosts[@]}"; do
        echo -e "\n${YELLOW}$(get_text "git_urls_host" "$host")${NC}"
        read -p "$(get_text "git_urls_path"): " repo_path
        
        if [ ! -z "$repo_path" ]; then
            git remote set-url origin git@${host}:${repo_path}.git
            echo "$(get_text "git_urls_set" "$host" "git@${host}:${repo_path}.git")"
            # Store the configured URL
            safe_filename=$(sanitize_filename "$host")
            echo "$repo_path" > "$ssh_dir/git_url_${safe_filename}"
        fi
    done
}

# Function to check if Git URLs are configured
check_git_urls() {
    local all_configured=true
    local ssh_dir=$(get_ssh_dir)
    local config_file=$(get_ssh_config)
    
    if [ ! -f "$config_file" ]; then
        echo "false"
        return
    fi
    
    hosts=($(grep "^Host " "$config_file" | awk '{print $2}'))
    for host in "${hosts[@]}"; do
        safe_filename=$(sanitize_filename "$host")
        if [ ! -f "$ssh_dir/git_url_${safe_filename}" ]; then
            all_configured=false
            break
        fi
    done
    echo $all_configured
}

# Function to check if Git global config is set
check_git_global_config() {
    local ssh_dir=$(get_ssh_dir)
    if [ -f "$ssh_dir/git_global_name" ] && [ -f "$ssh_dir/git_global_email" ]; then
        echo "true"
    else
        echo "false"
    fi
}

# Function to show current configuration
show_current_config() {
    local ssh_dir=$(get_ssh_dir)
    local config_file=$(get_ssh_config)
    
    echo -e "\n${GREEN}$(get_text "config_title")${NC}"
    
    # Show SSH hosts
    echo -e "\n${YELLOW}$(get_text "config_ssh_hosts")${NC}"
    if [ -f "$config_file" ]; then
        grep "^Host " "$config_file" | awk '{print $2}' | while read host; do
            echo -e "${BOLD}$host${NC}"
        done
    else
        echo "$(get_text "config_no_hosts")"
    fi
    
    # Show Git global config
    echo -e "\n${YELLOW}$(get_text "config_git_global")${NC}"
    if [ "$(check_git_global_config)" = "true" ]; then
        echo -e "Name: ${BOLD}$(cat "$ssh_dir/git_global_name")${NC}"
        echo -e "Email: ${BOLD}$(cat "$ssh_dir/git_global_email")${NC}"
    else
        echo "$(get_text "config_not_configured")"
    fi
    
    # Show Git URLs
    echo -e "\n${YELLOW}$(get_text "config_git_urls")${NC}"
    if [ -f "$config_file" ]; then
        hosts=($(grep "^Host " "$config_file" | awk '{print $2}'))
        for host in "${hosts[@]}"; do
            safe_filename=$(sanitize_filename "$host")
            if [ -f "$ssh_dir/git_url_${safe_filename}" ]; then
                echo -e "${BOLD}$host${NC}: ${ITALIC}$(cat "$ssh_dir/git_url_${safe_filename}")${NC}"
            fi
        done
    else
        echo "$(get_text "config_no_config")"
    fi
}

# Main menu
show_menu() {
    echo -e "\n${GREEN}$(get_text "menu_title")${NC}"
    echo -e "${BOLD}1) $(get_text "menu_ssh")${NC}"
    echo -e "${BOLD}2) $(get_text "menu_git_global")${NC}"
    echo -e "${BOLD}3) $(get_text "menu_git_urls")${NC}"
    echo -e "${BOLD}4) $(get_text "menu_show_config")${NC}"
    echo -e "${BOLD}5) $(get_text "menu_exit")${NC}"
    echo -n "$(get_text "menu_prompt")"
}

# Main loop
while true; do
    show_menu
    read choice
    
    case $choice in
        1)
            configure_ssh
            ;;
        2)
            if [ "$(check_git_global_config)" = "true" ]; then
                echo -e "\n${GREEN}$(get_text "git_global_exists")${NC}"
                echo "Name: $(cat "$(get_ssh_dir)/git_global_name")"
                echo "Email: $(cat "$(get_ssh_dir)/git_global_email")"
                read -p "$(get_text "git_global_reconfigure")" reconfigure
                if [[ "$reconfigure" =~ ^[Yy]$ ]]; then
                    set_git_global_config
                fi
            else
                set_git_global_config
            fi
            ;;
        3)
            if [ "$(check_git_urls)" = "true" ]; then
                echo -e "\n${GREEN}$(get_text "git_urls_exists")${NC}"
                read -p "$(get_text "git_urls_reconfigure")" reconfigure
                if [[ "$reconfigure" =~ ^[Yy]$ ]]; then
                    set_git_urls
                fi
            else
                set_git_urls
            fi
            ;;
        4)
            show_current_config
            ;;
        5)
            echo -e "${GREEN}$(get_text "exiting")${NC}"
            exit 0
            ;;
        *)
            echo -e "${YELLOW}$(get_text "invalid_choice")${NC}"
            ;;
    esac
done 
