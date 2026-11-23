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
    batfi
    brave-browser
    caffeine
    drawio
    font-jetbrains-mono-nerd-font
    ghostty
    git-credential-manager
    google-chrome
    keeper-password-manager
    keka
    logi-options+
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

##### Linux Specific
if OS.linux?
  # Formulas
  %w[
    bubblewrap
  ].each { |name| brew name }
end

####################
%w[
  azure-cli
  gcloud-cli
  terraform-linters/tap/tflint
].each { |name| cask name }

%w[
  actionlint
  ansible
  ast-grep
  aws-iam-authenticator
  aws/tap/eksctl
  awscli
  bat
  bind
  checkov
  cilium-cli
  cocogitto
  colima
  dnsglobe
  docker
  docker-buildx
  docker-compose
  fd
  fzf
  gcc
  gh
  ghostscript
  gitleaks
  glab
  go
  goose
  gosec
  grex
  hashicorp/tap/sentinel
  hashicorp/tap/terraform
  helm
  helm-docs
  iam-policy-json-to-terraform
  imagemagick
  java
  jq
  kind
  kondo
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
  opa
  opentofu
  oxker
  pipx
  poppler
  pre-commit
  pwgen
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
  uv
  viddy
  virtualenvwrapper
  visidata
  wget
  whois
  yq
  zip
  zoxide
].each { |name| brew name }
