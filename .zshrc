autoload -U +X bashcompinit && bashcompinit

path=(
  "${HOME}/.local/bin"
  "${KREW_ROOT:-$HOME/.krew}/bin"
  $path
)

case "$(uname -s)" in
Darwin)
  if [[ -d /opt/homebrew/opt/ruby/bin ]]; then
    path=(/opt/homebrew/opt/ruby/bin $path)
  fi
  ;;
Linux)
  alias fix_kbd='setxkbmap us -variant intl &> /dev/null'

  if [[ -x /home/linuxbrew/.linuxbrew/bin/brew ]]; then
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
  fi
  ;;
esac

export ANSIBLE_PYTHON_INTERPRETER=auto_silent
export EDITOR=nvim
export SDKMAN_DIR="${HOME}/.sdkman"
export ZSH="${HOME}/.oh-my-zsh"
export SHOW_AWS_PROMPT=false

ZSH_THEME="robbyrussell"
zstyle :omz:plugins:ssh-agent quiet yes

plugins=(
  aws
  azure
  docker
  fzf
  gcloud
  git
  git-auto-fetch
  helm
  kubectx
  ssh-agent
  terraform
  urltools
)

if [[ -r "${ZSH}/oh-my-zsh.sh" ]]; then
  source "${ZSH}/oh-my-zsh.sh"
fi

if [[ -s "${HOME}/.sdkman/bin/sdkman-init.sh" ]]; then
  source "${HOME}/.sdkman/bin/sdkman-init.sh"
fi

function aws-clear() {
  asr &>/dev/null
  asp &>/dev/null
}

function aws-profile() {
  asp $(aws_profiles | fzf)
}

function aws-region() {
  if [[ ! -f ~/.aws/regions ]]; then
    touch ~/.aws/regions
  fi
  asr $(fzf <~/.aws/regions)
}

command -v bat &>/dev/null && alias cat='bat -p'
command -v nvim &>/dev/null && alias vim='nvim'
command -v terragrunt &>/dev/null && complete -o nospace -C "$(command -v terragrunt)" terragrunt
