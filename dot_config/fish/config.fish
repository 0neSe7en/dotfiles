if not functions -q fisher
    set -q XDG_CONFIG_HOME
    or set XDG_CONFIG_HOME ~/.config
    curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
    fish -c fisher
end

#source ~/.config/up/up.fish

set -g theme_powerline_fonts no

# FZF Done

# Themes
set -g theme_nerd_fonts yes
set -g theme_display_k8s_context yes
set -g theme_display_cmd_duration yes
set -g theme_show_exit_status yes
set -g theme_display_vagrant no
set -g theme_color_scheme dracula

# Theme Done

function hybrid_bindings --description "Vi-style bindings that inherit emacs-style bindings in all modes"
    for mode in default insert visual
        fish_default_key_bindings -M $mode
    end
    fish_vi_key_bindings --no-erase
end

set -g fish_key_bindings hybrid_bindings


function export
  set var1 (echo $argv | cut -f1 -d=)
  set var2 (echo $argv | cut -f2 -d=)
  set -x -g $var1 $var2
end

# retrieve command cheat sheets from cheat.sh
# fish version by @tobiasreischmann

function cheat.sh
    curl cheat.sh/$argv
end

source ~/.config/fish/env.fish
source ~/.shellaliases
source ~/.shellvars

set -g fish_user_paths "/usr/local/opt/ruby/bin" $fish_user_paths

starship init fish | source
zoxide init fish | source
source "(brew --prefix asdf)"/libexec/asdf.fish
