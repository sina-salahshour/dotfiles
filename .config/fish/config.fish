if status is-interactive
    starship init fish | source
    alias ls=lsd
    set -gx PATH "$HOME/.local/bin" $PATH
    set -gx PATH "$HOME/.config/emacs/bin" $PATH

    zoxide init fish | source
    alias cd=z
    alias md=mkdir
    alias l="ls -ltrh"
    alias la="ls -ltrha"
    alias pnpv="pnpm env --global use"
    alias getsubs="curl 'https://sub.endoftheline.cloud/subscribe?tkn=fd82ce20d1c10d1e20b154950' | base64 --decode | kitty +kitten clipboard"
    alias gpush='git push origin $(git branch --show-current)'
    alias gpushc='git push origin $(git branch --show-current) && git branch --show-current | kitty +kitten clipboard'
    alias gpull='git pull origin $(git branch --show-current):$(git branch --show-current)'
    alias cjq='kitty +kitten clipboard --get-clipboard | jq | kitty +kitten clipboard'
    alias calculator="python"

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


set -x MOZ_ENABLE_WAYLAND 1

# bit
set -gx PATH $PATH /home/drhe/bin /opt/flutter/bin
set -gx CHROME_EXECUTABLE google-chrome-stable
# bit end

# pnpm
set -gx PNPM_HOME "/home/drhe/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
    set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH


set --export PATH $HOME/.ghcup/bin $PATH

set --export PATH $HOME/.cargo/bin $PATH


set -q GHCUP_INSTALL_BASE_PREFIX[1]; or set GHCUP_INSTALL_BASE_PREFIX $HOME ; set -gx PATH $HOME/.cabal/bin /home/drhe/.ghcup/bin $PATH # ghcup-env
