info()  { echo -e "${GREEN}==>${NC} $1"; }
warn()  { echo -e "${YELLOW}[!]${NC} $1"; }
error() { echo -e "${RED}[x]${NC} $1"; exit 1; }

info "[i] installing bloat"
yay -Syu --needed --noconfirm --disable-download-timeout \
	hyprland \
	hyprshot \
	hyprlock \
	hypridle \
	swaybg \
	waybar \
	mako \
	wofi \
	grim \
	slurp \
	wlsunset \
	playerctl \
	brightnessctl \
	cpu-autofreq \
	pavucontrol \
	nm-connection-editor \
	librewolf-bin \
	stow \

info "[i] enabling bullshit..."

info "now run: stow <package_name>"
info "example: "
echo -e "\tstow hypr tmux wofi mako zsh waybar"
