# Path to your oh-my-fish.
set fish_path $HOME/.oh-my-fish

# Theme
set fish_theme bobthefish

# All built-in plugins can be found at ~/.oh-my-fish/plugins/
# Custom plugins may be added to ~/.oh-my-fish/custom/plugins/
# Enable plugins by adding their name separated by a space to the line below.
set fish_plugins sublime python node git-flow ssh

# Path to your custom folder (default path is ~/.oh-my-fish/custom)
#set fish_custom $HOME/dotfiles/oh-my-fish

# Load oh-my-fish configuration.
. $fish_path/oh-my-fish.fish

set PATH /Users/wsy/.rvm/bin /Users/wsy/dev/phabricator/arcanist/bin $PATH
set FPP_EDITOR mvim
set EDITOR mvim
alias gb "git branch "
alias gc "git checkout "
alias gcb "git checkout -b "
alias gs "git status"
alias gl "git log"

function __thefuck_repl -d 'Replace operators into fish-compatible'
    set -l tmp (echo $argv | sed 's/ && / ; and /g')
        echo $tmp | sed 's/ || / ; or /g'
        end

        function fuck -d 'Correct your previous console command'
            set -l eval_script (mktemp 2>/dev/null ; or mktemp -t 'thefuck')
                thefuck $history[1] > $eval_script
                    eval (__thefuck_repl (cat $eval_script))
      rm $eval_script
      end
