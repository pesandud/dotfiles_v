ZSH_THEME="robbyrussell" # set by `omz`

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

autoload -Uz compinit
compinit

zinit snippet OMZ::lib/completion.zsh

zinit light ohmyzsh/ohmyzsh
zinit light Aloxaf/fzf-tab
zinit light zsh-users/zsh-completions

[[ -f /usr/share/fzf/completion.zsh ]] && source /usr/share/fzf/completion.zsh
[[ -f /usr/share/fzf/key-bindings.zsh ]] && source /usr/share/fzf/key-bindings.zsh

# PROMPT='%F{#5c6a8e}[%F{#7aa2f7}%n%F{#5c6a8e}@%F{#9ece6a}%m%F{#5c6a8e} %F{#e0af68}%1~%F{#5c6a8e}] %f'
# PROMPT="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "

export BAT_THEME="tokyonight_night"
export EDITOR=nvim
export NVIM_APPNAME=nvim
declare -x http_proxy=socks5h://192.168.42.129:9050
declare -x https_proxy=socks5h://192.168.42.129:9050

export _JAVA_AWT_WM_NONREPARENTING=1

typeset -U path
path=( ~/scripts ~/.local/bin ~/.npm_global/bin $path )

setopt correct autocd autopushd pushdignoredups pushdminus
HISTSIZE=5000
HISTFILE=$HOME/.zsh_history
SAVEHIST=$HISTSIZE
setopt appendhistory sharehistory hist_ignore_space hist_ignore_all_dups \
       hist_save_no_dups hist_ignore_dups hist_find_no_dups hist_verify

burp() {
    local loader="$HOME/.tools/burp/BurpLoaderKeygen_v1.18.jar"
    local jar="$HOME/.tools/burp/burpsuite_pro_v2025.11.3/burpsuite_pro_v2025.11.3.jar"
    java --add-opens=java.desktop/javax.swing=ALL-UNNAMED \
         --add-opens=java.base/java.lang=ALL-UNNAMED \
         --add-opens=java.base/jdk.internal.org.objectweb.asm=ALL-UNNAMED \
         --add-opens=java.base/jdk.internal.org.objectweb.asm.tree=ALL-UNNAMED \
         --add-opens=java.base/jdk.internal.org.objectweb.asm.Opcodes=ALL-UNNAMED \
         -javaagent:"$loader" -noverify -jar "$jar" "$@"
}

ex() {
  if [ -f "$1" ] ; then
    case "$1" in
      *.tar.bz2) tar xjf "$1" ;; *.tar.gz) tar xzf "$1" ;; *.bz2) bunzip2 "$1" ;;
      *.rar) unrar x "$1" ;; *.gz) gunzip "$1" ;; *.tar) tar xf "$1" ;;
      *.zip) unzip "$1" ;; *.7z) 7z x "$1" ;;
      *) echo "'$1' cannot be extracted via ex()" ;;
    esac
  else echo "'$1' is not a valid file" ; fi
}

i(){ yay -S --disable-download-timeout --needed "${@}"; }
s(){ yay "${@}"; }
u(){ yay -Rns "${@}"; }

tns() { tmux new -s "${1:-main}"; }
tat() { local session=$(tmux ls | fzf); [[ $session ]] && tmux a -t "${session%%:*}"; }

pullzsh(){ git -C ~/.zsh/plugins/fzf-tab pull; git -C ~/.zsh/plugins/zsh-completions pull; }

gc(){ if [[ $# -eq 0 ]]; then git commit --allow-empty-message -m ""; else git commit -m "$@"; fi; }

sn(){
  neofetch; echo -ne "shutting down in "; for i in {1..3}; do echo -ne "${i}... "; sleep 0.9; done
  echo; shutdown now
}

pipxa(){ unset http_proxy https_proxy; p pipx install "${@}" -v; source ~/.zshrc; }
pipxu(){ p pipx uninstall "${@}"; }

mann(){ man $1 | bat -l man --style=-numbers }

# suffix aliases
alias -s md="bat"
alias -s png="qiv"
alias -s jpg="qiv"
alias -s pcap="wireshark"
alias -s json="jq ."
alias -s html="librewolf"
alias -s log="bat"
alias -s pdf="evince"
alias -s py="python3"
# global aliases
alias -g NE="2>/dev/null"
alias -g C="| wl-copy"
alias -g G='| grep --color=auto'
alias -g L='| bat'
alias -g M='| most'
alias -g H='| head'
alias -g T='| tail'
alias -g H="--help"
# recursively grep for a string
alias -g RG='| xargs rg --line-number --column --smart-case'
# normal mfs
alias t="tmux"
alias hex='_hex(){ printf "0x%x\n" $(($1)) }; _hex'
alias dec='_dec(){ printf "%d\n" $(($1)) }; _dec'
alias oct='_oct(){ printf "0o%o\n" $(($1)) }; _oct'
alias bin='_bin(){ echo "obase=2; $1" | bc | sed "s/^/0b/" }; _bin'
alias sc="sudo systemctl"
alias obsidian="obsidian --disable-gpu --proxy-server=socks5://192.168.42.129:9050"
alias pvi="proxychains -q nvim"
alias please="sudo"
alias uns="unset http_proxy https_proxy"
alias vi="nvim"
alias ..="cd .."
alias ...="cd ../.."
alias .3="cd ../../.."
alias .4="cd ../../../.."
alias chm="chmod +x"
alias py="python3"
alias ipy="ipython3"
alias sus="systemctl suspend"
alias y="yazi"
alias ghidra="export _JAVA_AWT_WM_NONREPARENTING=1 AWT_TOOLKIT=MToolkit; /usr/bin/ghidra "
alias chem="cd ~/al/chem/pap"
alias ph="cd ~/al/ph/pap"
alias cm="cd ~/al/cm/pap"
# alias mdwms="cd ~/dotfiles/suckless/dwmstatus; sudo make clean install; cd -"
# alias mdwm="cd ~/dotfiles/rice/dwm-flexipatch/; sudo make clean install; cd -"
alias mst="cd ~/dotfiles/st-flexipatch; sudo make clean install; cd -"
alias pav="pavucontrol"
alias neofetch="fastfetch --config examples/22.jsonc"
alias git="proxychains -q git"
alias gs="git status"
alias ga="git add ."
alias gd="git diff"
alias gp="git push -u origin main"
alias gall="ga; gc; gp"
alias p="proxychains -q" 
alias vizsh="vi ~/.zshrc" 
alias so="source ~/.zshrc" 
alias autorm="sudo pacman -Rns \$(pacman -Qdtq)"
alias tks="tmux kill-server"
alias ta="tmux attach"
alias t="tmux"
# alias copy="xclip -selection clipboard"
alias copy="wl-copy"
alias ls="eza --icons --grid --sort=name"
alias la="ls -lah"
alias lt="ls --tree"
alias ll="ls -l"
alias c="clear"
# alias vii3="vi ~/.config/i3/config"
alias vist="vi ~/dotfiles/st-flexipatch/config.h"
# alias viniri="vi ~/dotfiles/niri/.config/niri/config.kdl"
alias vivi="vi ~/.config/nvim"
alias visw="vi ~/.config/sway/config"

# keybindings
bindkey -v
bindkey -M viins '^p' history-search-backward
bindkey -M viins '^n' history-search-forward
bindkey -M viins 'jk' vi-cmd-mode
bindkey '^u' backward-kill-word
bindkey '^r' fzf-history-widget
bindkey '^t' fzf-file-widget
bindkey '^g' fzf-cd-widget

# _force_block_cursor() { echo -ne '\e[2 q' }
# _force_block_cursor
# precmd_functions+=(_force_block_cursor)
# zle-keymap-select() { _force_block_cursor }
# zle -N zle-keymap-select
#
# Widgets
autoload -Uz edit-command-line
zle -N edit-command-line; bindkey '^x^e' edit-command-line
clear-keep-buffer(){ zle clear-screen }; zle -N clear-keep-buffer; bindkey '^Fl' clear-keep-buffer
copy-cmd(){ echo -n $BUFFER | wl-copy; zle -M "copied!" }; zle -N copy-cmd; bindkey '^Y' copy-cmd
fancy-ctrl-z () { if [[ $#BUFFER -eq 0 ]]; then fg 2>/dev/null || zle redisplay; else zle push-input; zle clear-screen; fi }; zle -N fancy-ctrl-z; bindkey '^Z' fancy-ctrl-z

# crazy fzf stuff
export FZF_DEFAULT_OPTS="--highlight-line --info=inline-right --ansi --layout=reverse --border=none --color=bg+:#283457,bg:#16161e,border:#27a1b9,fg:#c0caf5,gutter:#16161e,header:#ff9e64,hl+:#2ac3de,hl:#2ac3de,info:#545c7e,marker:#ff007c,pointer:#ff007c,prompt:#2ac3de,query:#c0caf5:regular,scrollbar:#27a1b9,separator:#ff9e64,spinner:#ff007c"

zstyle ':fzf-tab:*' fzf-flags --height=40% --border --layout=reverse
zstyle ':fzf-tab:complete:*:*' fzf-preview 'if [ -d $realpath ]; then eza --tree --color=always --level=2 $realpath; else bat --color=always --style=numbers --line-range=:500 $realpath; fi'

eval "$(zoxide init --cmd cd zsh)"
