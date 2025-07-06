# alias settings
alias vim="nvim"

# nvim as default editor
export EDITOR=/usr/bin/nvim

# setup for bash
# Function to get git branch if present
parse_git_branch() {
  git branch 2>/dev/null | sed -n '/\* /s///p'
}

# Function to get conda env if active
parse_conda_env() {
  if [[ -n "$CONDA_DEFAULT_ENV" ]]; then
    echo "($CONDA_DEFAULT_ENV)"
  fi
}

# Colors
RED="\[\033[0;31m\]"
GREEN="\[\033[0;32m\]"
YELLOW="\[\033[0;33m\]"
BLUE="\[\033[0;34m\]"
CYAN="\[\033[0;36m\]"
RESET="\[\033[0m\]"

# Set PS1
PS1="${GREEN}\u${CYAN}\$(parse_conda_env)${YELLOW}\$(git_branch=\$(parse_git_branch); [[ -n \$git_branch ]] && echo \"[\$git_branch]\")${RESET} \$ "

