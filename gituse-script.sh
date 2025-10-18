#!/bin/bash
# gituse.sh
# Simple profile switcher for multiple GitHub accounts (personal, work, client)

gituse() {
  local account="$1"

  if [ -z "$account" ]; then
    echo "Usage: gituse <personal|work|client>"
    return 1
  fi

  case "$account" in
    personal)
      git config --global user.name "Ayman Kassab"
      git config --global user.email "your_personal_email@example.com"
      git config --global credential.username "akassab"
      ;;
    work)
      git config --global user.name "Ayman Kassab"
      git config --global user.email "ayman.kassab@aircanada.ca"
      git config --global credential.username "Ayman-Kassab_acgithub"
      ;;
    client)
      git config --global user.name "Ayman Kassab"
      git config --global user.email "your_client_email@example.com"
      git config --global credential.username "client-username"
      ;;
    *)
      echo "Unknown profile: $account"
      echo "Available: personal, work, client"
      return 1
      ;;
  esac

  echo "✅ Switched Git identity to: $(git config user.name) <$(git config user.email)>"
}
