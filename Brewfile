# frozen_string_literal: true

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

  # Apple Store
  {
    'WireGuard' => 1_451_685_025
  }.each { |name, id| mas name, id: id }
end
####################

# System and bootstrap formulas
%w[
  bind
  colima
  gcc
  ghostscript
  imagemagick
  krew
  luacheck
  mandoc
  mermaid-cli
  mise
  netcat
  poppler
  sshpass
  stow
  tio
  unzip
  utftex
  wget
  whois
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
