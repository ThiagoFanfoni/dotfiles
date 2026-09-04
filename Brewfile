# frozen_string_literal: true

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
    google-drive
    keeper-password-manager
    logi-options+
    microsoft-teams
    music-decoy
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
  codex
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
  fd
  fzf
  gcc
  gh
  ghostscript
  gitleaks
  go
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
  lua
  luacheck
  mandoc
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
  sshpass
  stow
  stylua
  talosctl
  terraform-docs
  terragrunt
  tfsec
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
