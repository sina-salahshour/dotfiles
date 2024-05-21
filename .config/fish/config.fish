if status is-interactive
    starship init fish | source
    zoxide init fish | source
    alias ls=lsd
    set -gx PATH "$HOME/.local/bin" $PATH
    set -gx PATH "/opt/cuda/bin" $PATH
    set -gx PATH "$HOME/.config/emacs/bin" $PATH
    set EDITOR vi

    alias cd=z
    alias md=mkdir
    alias l="ls -ltrh"
    alias la="ls -ltrha"
    alias pnpv="pnpm env --global use"
    alias gpush='git push origin $(git branch --show-current)'
    alias gpushc='git push origin $(git branch --show-current) && git branch --show-current | kitty +kitten clipboard'
    alias gpull='git pull origin $(git branch --show-current):$(git branch --show-current)'
    # alias cjq='kitty +kitten clipboard --get-clipboard | jq | kitty +kitten clipboard'
    alias calculator="python"
    alias shit="systemctl hibernate"

    function cm
        mkdir --parent $argv[1]
        cd $argv[1]
    end
    function cw
        cd $(dirname $(whereis $argv[1] | sed 's/\S*\s*\(\S*\).*/\1/'))
    end
    # function windows_reboot
    #     set WINDOWS_TITLE $(dudo "grep -i \"^menuentry 'Windows\" /boot/grub/grub.cfg |head -n 1 | cut -d\"'\" -f2")
    #     dudo "grub-reboot \"$WINDOWS_TITLE\""
    #     reboot
    # end
end
function rk
    sway splith;
    sway exec "kitty --directory=$PWD"
end
function bk
    sway splitv;
    sway exec "kitty --directory=$PWD"
end


set -x MOZ_ENABLE_WAYLAND 1

# pnpm
set -gx PNPM_HOME "/home/drhe/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
    set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end

# set --export PATH $HOME/.ghcup/bin $PATH

set --export PATH $HOME/.cargo/bin $PATH


# set -q GHCUP_INSTALL_BASE_PREFIX[1]; or set GHCUP_INSTALL_BASE_PREFIX $HOME ; set -gx PATH $HOME/.cabal/bin /home/drhe/.ghcup/bin $PATH # ghcup-env

# opam configuration
source /home/drhe/.opam/opam-init/init.fish > /dev/null 2> /dev/null; or true
