if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

HISTFILE="$HOME/.bash_hist"
HISTSIZE=1000000
HISTFILESIZE=1000000
HISTCONTROL=ignoredups
PROMPT_COMMAND="history -a; $PROMPT_COMMAND"
sync_bash_history() { history -c; history -r; }

if [[ $- == *i* ]]; then
    stty -ixon
    IGNOREEOF=9
    PS1="[\[$(tput sgr0)\]\[$(tput bold)\]\[\033[38;5;14m\]\$?\[$(tput sgr0)\]] \[$(tput sgr0)\]\[\033[38;5;248m\]\t\[$(tput sgr0)\] \[$(tput sgr0)\]\[\033[38;5;229m\]\u\[$(tput sgr0)\]@\[$(tput sgr0)\]\[\033[38;5;223m\]\h\[$(tput sgr0)\]:\[$(tput sgr0)\]\[\033[38;5;195m\]\w\[$(tput sgr0)\]\[$(tput bold)\]\[\033[38;5;219m\]\\$\[$(tput sgr0)\] \[$(tput sgr0)\]"
fi

ulimit -c unlimited

dedup_path() { export PATH="$(perl -e 'print join ":", grep { !$seen{$_}++ } split /:/, $ENV{PATH}, -1')"; }
dedup_ld_library_path() { export LD_LIBRARY_PATH="$(perl -e 'print join ":", grep { !$seen{$_}++ } split /:/, $ENV{LD_LIBRARY_PATH}, -1')"; }

export PATH="$HOME/.local/bin:$PATH"
dedup_path
dedup_ld_library_path
