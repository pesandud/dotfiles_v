info()  { echo -e "${GREEN}==>${NC} $1"; }
warn()  { echo -e "${YELLOW}[!]${NC} $1"; }
error() { echo -e "${RED}[x]${NC} $1"; exit 1; }

info "installing dependencies"
yay -S --needed --noconfirm --disable-download-timeout \
    sway \
    swaybg \
    swayidle \
    swaylock \
    waybar \
    mako \
    rofi \
    grim \
    slurp \
    wlsunset \
    playerctl \
    brightnessctl \
	cpu-autofreq \
    pavucontrol \
    python3 \
    ttf-jetbrains-mono-nerd \
    nm-connection-editor \
    networkmanager \
	librewolf-bin \
	wlsunset \
	tlp \
    stow \

info "enabling services..."

info "now manually run: stow <package>"
info "example: "
echo -e "\tstow sway tmux rofi mako zsh waybar"
