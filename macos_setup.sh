#!/bin/bash
#
# 🍎 macOS SSH Setup
# 🔐 SSH configuration script for macOS systems

# Colors for output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${GREEN}Setting up MediKoGPT SSH Setup Tool for macOS...${NC}"

# Create scripts directory
echo -e "${YELLOW}Creating scripts directory...${NC}"
mkdir -p ~/scripts

# Copy the script
echo -e "${YELLOW}Copying setup script...${NC}"
cp setup_ssh.sh ~/scripts/
chmod +x ~/scripts/setup_ssh.sh

# Detect shell
if [ -n "$ZSH_VERSION" ]; then
    CONFIG_FILE=~/.zshrc
    echo -e "${YELLOW}Detected zsh shell${NC}"
elif [ -n "$BASH_VERSION" ]; then
    CONFIG_FILE=~/.bash_profile
    echo -e "${YELLOW}Detected bash shell${NC}"
else
    echo -e "${YELLOW}Could not detect shell type. Using ~/.bash_profile${NC}"
    CONFIG_FILE=~/.bash_profile
fi

# Add aliases
echo -e "${YELLOW}Adding aliases to $CONFIG_FILE...${NC}"
cat << EOF >> "$CONFIG_FILE"

# MediKoGPT SSH Setup Tool aliases
alias setup_ssh="~/scripts/setup_ssh.sh"
alias git_setup_global="setup_ssh 2"
alias git_setup_urls="setup_ssh 3"
alias git_show_config="setup_ssh 4"
EOF

# Reload shell configuration
echo -e "${YELLOW}Reloading shell configuration...${NC}"
source "$CONFIG_FILE"

echo -e "${GREEN}Setup complete! You can now use the following commands:${NC}"
echo -e "  ${YELLOW}setup_ssh${NC} - Run the full setup script"
echo -e "  ${YELLOW}git_setup_global${NC} - Configure Git global settings"
echo -e "  ${YELLOW}git_setup_urls${NC} - Configure Git repository URLs"
echo -e "  ${YELLOW}git_show_config${NC} - Show current configuration"
echo -e "\n${GREEN}To start using the tool, run:${NC}"
echo -e "  ${YELLOW}setup_ssh${NC}" 
