# Paths

typeset -U path PATH
typeset -U fpath FPATH
path=(
  "${HOME}/.local/bin"
  "${KREW_ROOT:-$HOME/.krew}/bin"
  $path

)
# fpath=(
#   "${XDG_CONFIG_HOME:-${HOME}/.config}/zsh/completions"
#   $fpath
# )

if [[ -z "${HOMEBREW_PREFIX:-}" ]]; then
  for brew in /opt/homebrew/bin/brew /usr/local/bin/brew /home/linuxbrew/.linuxbrew/bin/brew; do
    [[ -x "${brew}" ]] || continue
    eval "$("${brew}" shellenv)"
    break
  done
  unset brew
fi

if [[ -d "$(brew --prefix)/share/google-cloud-sdk" ]]; then
  export CLOUDSDK_HOME="$(brew --prefix)/share/google-cloud-sdk"
fi

# Environment

export ANSIBLE_PYTHON_INTERPRETER=auto_silent
export CKV_SKIP_PACKAGE_UPDATE_CHECK=true

# Tool initialization

## Runtime

export MISE_DEFAULT_CONFIG_FILENAME=".mise.toml"

if (( ${+commands[mise]} )); then
  eval "$(mise activate zsh)"
fi

if (( ${+commands[nvim]} )); then
  export EDITOR='nvim'
  alias vim='nvim'
else
  export EDITOR=vi
fi
export VISUAL="${EDITOR}"

## Oh My Zsh

export SHOW_AWS_PROMPT=false
export ZSH="${HOME}/.oh-my-zsh"

ZSH_THEME="robbyrussell"
zstyle :omz:plugins:ssh-agent quiet yes
zstyle :omz:plugins:ssh-agent lazy yes
zstyle :omz:plugins:ssh-agent lifetime 4h
zstyle ':completion:*:*:-command-:*:*' ignored-patterns 'kubectl-*' 'kubectx_*'

plugins=(
  ${commands[aws]:+aws}
  ${commands[docker-compose]:+docker-compose}
  ${commands[fzf]:+fzf}
  ${commands[fzf]:+zsh-interactive-cd}
  ${commands[gcloud]:+gcloud}
  ${commands[go]:+golang}
  ${commands[ssh-agent]:+ssh-agent}
  ${commands[terraform]:+terraform}
  ${commands[tofu]:+opentofu}
)

if [[ -r "${ZSH}/oh-my-zsh.sh" ]]; then
  source "${ZSH}/oh-my-zsh.sh"
fi

## Additional completions

if (( ${+commands[terragrunt]} && ${+functions[complete]} )); then
  complete -o nospace -C "${commands[terragrunt]}" terragrunt
fi

if (( ${+commands[kustomize]} && ${+functions[compdef]} )); then
  source <("${commands[kustomize]}" completion zsh)
fi

# Functions

aws-clear() {
  asr &>/dev/null
  asp &>/dev/null
}

aws-profile() {
  local profile

  profile=$(aws_profiles | fzf) || return
  [[ -n "${profile}" ]] || return 1

  asp "${profile}"
}

aws-region() {
  local region
  local regions_file="${HOME}/.aws/regions"

  if [[ ! -e "${regions_file}" ]]; then
    mkdir -p "${HOME}/.aws" || return
    touch "${regions_file}" || return
  fi

  if [[ ! -s "${regions_file}" ]]; then
    print -u2 "aws-region: add one region per line to ${regions_file}"
    return 1
  fi

  region=$(fzf <"${regions_file}") || return
  [[ -n "${region}" ]] || return 1

  asr "${region}"
}

brew-bundle() {
  local bundle_status=1
  local sudo_keepalive_pid

  if [[ "${OSTYPE}" != darwin* ]]; then
    command brew bundle "$@"
    return
  fi

  sudo -v || return

  while sudo -n true 2>/dev/null; do
    sleep 60
  done &
  sudo_keepalive_pid=$!

  {
    command brew bundle "$@"
    bundle_status=$?
  } always {
    kill "${sudo_keepalive_pid}" 2>/dev/null
    wait "${sudo_keepalive_pid}" 2>/dev/null
  }

  return "${bundle_status}"
}

lazygit() {
  command lazygit --use-config-file="${HOME}/.config/lazygit/config.yml" "$@"
}

# Aliases

(( ${+commands[setxkbmap]} )) && alias fix_kbd='setxkbmap us -variant intl'
(( ${+commands[bat]} )) && alias cat='bat -p'
