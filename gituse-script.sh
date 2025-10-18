#!/bin/bash
# gituse.sh
# Single-arg profile switcher for HTTPS-based GitHub workflows.
# Usage: gituse <profile>
# Example: gituse personal

# -------------------------
# Edit your profiles here:
# -------------------------
declare -A NAME_MAP
declare -A EMAIL_MAP
declare -A USERNAME_MAP

# Example profiles. Replace with your info.
NAME_MAP[personal]="Your Personal Name"
EMAIL_MAP[personal]="personal@example.com"
USERNAME_MAP[personal]="your-personal-username"

NAME_MAP[work]="Your Work Name"
EMAIL_MAP[work]="you@work.com"
USERNAME_MAP[work]="your-work-username"

NAME_MAP[client]="Your Client Name"
EMAIL_MAP[client]="you@client.com"
USERNAME_MAP[client]="your-client-username"

# -------------------------
# Implementation
# -------------------------
_gituse_print_active() {
  echo "Active Git identity:"
  echo "  user.name            = $(git config --global user.name)"
  echo "  user.email           = $(git config --global user.email)"
  echo "  credential.username  = $(git config --global credential.username)"
}

gituse() {
  local profile="$1"
  if [ -z "$profile" ]; then
    echo "Usage: gituse <profile>"
    echo "Available profiles: ${!NAME_MAP[@]}"
    return 1
  fi

  local name="${NAME_MAP[$profile]}"
  local email="${EMAIL_MAP[$profile]}"
  local username="${USERNAME_MAP[$profile]}"

  if [ -z "$name" ] || [ -z "$email" ] || [ -z "$username" ]; then
    echo "Profile '$profile' is not defined. Edit gituse.sh to add it."
    echo "Available profiles: ${!NAME_MAP[@]}"
    return 1
  fi

  git config --global user.name "$name"
  git config --global user.email "$email"
  git config --global credential.username "$username"

  echo "Switched Git identity to: $profile"
  _gituse_print_active

  # Optional: uncomment to force Git to ask for the right token next push
  # echo -e "protocol=https\nhost=github.com\n" | git credential reject >/dev/null 2>&1
}

# Optional helper to list profiles
gituse-list() {
  echo "Configured profiles:"
  for key in "${!NAME_MAP[@]}"; do
    echo "  - $key  (${NAME_MAP[$key]} <${EMAIL_MAP[$key]}> | ${USERNAME_MAP[$key]})"
  done
}
