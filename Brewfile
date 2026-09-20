# frozen_string_literal: true

# Taps
%w[
  aws/tap
  hashicorp/tap
  siderolabs/tap
  terraform-linters/tap
].each { |name| tap name }

######### MAC Specific
if OS.mac?
  # Formulas
  %w[
    mas
  ].each { |name| brew name }

  # Mac Casks
  %w[
    appcleaner
    balenaetcher
    batfi
    brave-browser
    caffeine
    drawio
    ghostty
    git-credential-manager
    google-chrome
    keeper-password-manager
    music-decoy
    openlogi
    session-manager-plugin
    whatsapp
  ].each { |name| cask name }

  # Apple Store
  {
    'WireGuard' => 1_451_685_025
  }.each { |name, id| mas name, id: id }
end
####################

# System and bootstrap casks
%w[
  gcloud-cli
  terraform-linters/tap/tflint
].each { |name| cask name }

# System and bootstrap formulas
%w[
  actionlint
  ansible
  ast-grep
  aws-iam-authenticator
  awscli
  azure-cli
  bat
  bind
  checkov
  cilium-cli
  colima
  docker
  docker-compose
  fd
  fzf
  gcc
  gh
  ghostscript
  gitleaks
  go
  goose
  gosec
  hashicorp/tap/terraform
  helm
  helm-docs
  imagemagick
  java
  jq
  kind
  krew
  kubectl
  kubectx
  kustomize
  lazygit
  lsd
  lua
  luacheck
  mandoc
  markdownlint-cli2
  mermaid-cli
  mise
  neovim
  netcat
  node
  poppler
  pre-commit
  ripgrep
  ruby
  rust
  siderolabs/tap/talosctl
  sshpass
  staticcheck
  stow
  stylua
  terraform-docs
  terragrunt
  tio
  tree-sitter-cli
  trivy
  unzip
  utftex
  viddy
  wget
  whois
  yq
  zip
  zoxide
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
