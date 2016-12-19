# Clean, simple, compatible and meaningful.
# Tested on Linux, Unix and Windows under ANSI colors.
# It is recommended to use with a dark background and the font Inconsolata.
# Colors: black, red, green, yellow, *blue, magenta, cyan, and white.
#
# http://ysmood.org/wp/2013/03/my-ys-terminal-theme/
# Mar 2013 ys

# Machine name.
function box_name {
    [ -f ~/.box-name ] && cat ~/.box-name || hostname -s
}

# Directory info.
local current_dir='${PWD/#$HOME/~}'

# Git info.
local git_info='$(git_prompt_info)'
ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg[blue][git:%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$fg[blue]]$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}x"
ZSH_THEME_GIT_PROMPT_CLEAN=" %{$fg[green]%}o"

# svn info.
#local svn_info='$(svn_prompt_info)'
#ZSH_THEME_SVN_PROMPT_PREFIX=" %{$fg[blue](svn:%}"
#ZSH_THEME_SVN_PROMPT_SUFFIX="%{$fg[blue])$reset_color%}"
#ZSH_THEME_SVN_PROMPT_DIRTY=" %{$fg[red]%}x"
#ZSH_THEME_SVN_PROMPT_CLEAN=""

# Prompt format: \n # USER at MACHINE in DIRECTORY on git:BRANCH STATE [TIME] \n $
PROMPT="
%{$terminfo[bold]$fg[green]%}%n@$(box_name):\
%{$terminfo[bold]$fg[yellow]%}${current_dir}%{$reset_color%}\
${git_info}$(virtualenv_prompt_info)
%{$terminfo[bold]$fg[white]%}<%*>$ %{$reset_color%}"
