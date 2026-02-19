info()  { echo -e "${GREEN}==>${NC} $1"; }
warn()  { echo -e "${YELLOW}[!]${NC} $1"; }
error() { echo -e "${RED}[x]${NC} $1"; exit 1; }

info "[i] installing dependencies"
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
    power-profiles-daemon \
    pavucontrol \
    python3 \
    ttf-firacode-nerd \
    nm-connection-editor \
    networkmanager \
	librewolf-bin \
	wlsunset \
	tlp \
    stow \

info "enabling services..."
sudo systemctl enable --now NetworkManager
sudo systemctl enable --now power-profiles-daemon

info "now manually run: stow <package>"
