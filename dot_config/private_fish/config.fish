eval "$(/opt/homebrew/bin/brew shellenv)"

set -gx GOPATH "$HOME/go"
set -gx PYENV_ROOT "$HOME/.pyenv"
set -gx XDG_CONFIG_HOME "$HOME/.config"
set -gx SDKMAN_DIR "$HOME/.sdkman"
set -gx PNPM_HOME "$HOME/Library/pnpm"
set -gx BUN_INSTALL "$HOME/.bun"

set -gx FZF_DEFAULT_COMMAND 'fd --type f --strip-cwd-prefix'
set -gx FZF_CTRL_T_COMMAND "$FZF_DEFAULT_COMMAND"
set -gx GITHUB_USERNAME 0neSe7en

fish_add_path "$HOME/Library/Application Support/JetBrains/Toolbox/scripts"
fish_add_path "$PYENV_ROOT/bin"
fish_add_path "$HOME/.local/bin"
fish_add_path /usr/local/go/bin
fish_add_path "$GOPATH/bin"
fish_add_path /opt/homebrew/opt/postgresql@16/bin
fish_add_path "$HOME/.deno/bin"
fish_add_path "$HOME/.config/emacs/bin"
fish_add_path "$PNPM_HOME"
fish_add_path "$BUN_INSTALL/bin"
fish_add_path "$HOME/.antigravity/antigravity/bin"
fish_add_path /Applications/Obsidian.app/Contents/MacOS

function fish_hybrid_key_bindings --description \
"Vi-style bindings that inherit emacs-style bindings in all modes"
    for mode in default insert visual
        fish_default_key_bindings -M $mode
    end
    fish_vi_key_bindings --no-erase
end

function y
	set tmp (mktemp -t "yazi-cwd.XXXXXX")
	command yazi $argv --cwd-file="$tmp"
	if read -z cwd < "$tmp"; and [ "$cwd" != "$PWD" ]; and test -d "$cwd"
		builtin cd -- "$cwd"
	end
	rm -f -- "$tmp"
end

set -g fish_key_bindings fish_hybrid_key_bindings

string match -q "$TERM_PROGRAM" "WarpTerminal"
and set fish_key_bindings fish_default_key_bindings


if status is-interactive
    # Commands to run in interactive sessions can go here
end

source ~/.orbstack/shell/init2.fish
#atuin init fish | source
fzf --fish | source
zoxide init fish | source
#pyenv init - | source
starship init fish | source

alias vim="nvim"
alias kctl="kubectl"
alias brew="env PATH=(string replace (pyenv root)/shims '' \"\$PATH\") brew"
alias ag="rg"
alias ls="eza"
alias loc="tokei"

alias s="kitten ssh"
alias lg="lazygit"
alias darktable-cli='/Applications/darktable.app/Contents/MacOS/darktable-cli'

abbr -a tree eza -T

switcher init fish | source

function ks --wraps switcher
        kubeswitch $argv;
end

# Added by Antigravity
eval "$(mise activate fish)"
