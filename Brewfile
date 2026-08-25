# frozen_string_literal: true

# Taps
%w[
  aws/tap
  hashicorp/tap
  openai/tools
  siderolabs/tap
  terraform-linters/tap
].each { |name| tap name }

######### MAC Specific
if OS.mac?
  # Formulas
  %w[
    mas
  ].each { |name| brew name }

  # Casks
  %w[
    appcleaner
    balenaetcher
    brave-browser
    caffeine
    drawio
    ghostty
    git-credential-manager
    google-chrome
    google-drive
    keeper-password-manager
    logi-options+
    microsoft-teams
    music-decoy
    session-manager-plugin
    whatsapp
  ].each { |name| cask name }

  {
    'WireGuard' => 1_451_685_025
  }.each { |name, id| mas name, id: id }
end
####################

# Casks
%w[
  codex
  terraform-linters/tap/tflint
].each { |name| cask name }

# Formulas
%w[
  ansible
  aws-iam-authenticator
  awscli
  awslogs
  awsume
  azure-cli
  bat
  bind
  checkov
  cilium-cli
  colima
  docker
  docker-credential-helper-ecr
  fd
  fzf
  gcc
  ghostscript
  git-remote-codecommit
  go
  hashicorp/tap/terraform
  helm
  imagemagick
  jq
  kind
  krew
  kubectx
  kustomize
  lazygit
  luacheck
  luarocks
  mandoc
  mermaid-cli
  neovim
  netcat
  node
  pipx
  poppler
  pre-commit
  python
  ripgrep
  ruby
  rust
  siderolabs/tap/talosctl
  sshpass
  stow
  stylua
  terraform-docs
  terragrunt
  tfsec
  tio
  tree-sitter-cli
  unzip
  utftex
  viddy
  wget
  whois
  yq
  zip
].each { |name| brew name }

# Krew
%w[
  browse-pvc
  edit-secret
  explore
  krew
  node-shell
  node-ssm
  nodepools
  pv-migrate
  pv-mounter
  view-secret
].each { |name| krew name }
