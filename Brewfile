# frozen_string_literal: true

# Taps
%w[
  aws/tap
  openai/tools
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

  {
    'WireGuard' => 1_451_685_025
  }.each { |name, id| mas name, id: id }
end
####################

# Casks
%w[
  codex
].each { |name| cask name }

# Formulas
%w[
  awsume
  bat
  bind
  colima
  docker
  docker-credential-helper-ecr
  fd
  fzf
  gcc
  ghostscript
  imagemagick
  jq
  krew
  kubectx
  lazygit
  luacheck
  luarocks
  mandoc
  mise
  neovim
  netcat
  poppler
  ripgrep
  sshpass
  stow
  tio
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
