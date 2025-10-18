# gituse

Single-arg helper to switch between multiple GitHub accounts in your terminal using HTTPS credentials.
You run `gituse personal` or `gituse work`, and it updates your global Git identity accordingly.

No multi-parameter calls. One argument only: the profile name.

## What it does
- Sets `user.name`, `user.email`, and `credential.username` in your global Git config
- Optionally clears cached HTTPS credentials (so the next push pulls the right token)
- Prints the active identity

## Install
1) Save `gituse.sh` somewhere, e.g. `~/scripts/gituse.sh`.
2) Add this to your shell config (`~/.bashrc` or `~/.zshrc`):
```bash
source ~/scripts/gituse.sh
```
3) Reload your shell:
```bash
source ~/.bashrc
# or
source ~/.zshrc
```

## Configure profiles
Open `gituse.sh` and edit the profile values near the top.
There are three example profiles: `personal`, `work`, and `client`.
Replace the example names, emails, and usernames with yours.

## Usage
```bash
gituse personal
gituse work
gituse client
```

## Verify
```bash
git config --global user.name
git config --global user.email
git config --global credential.username
```

If a push uses the wrong GitHub account, your OS may have cached an old token.
Clear the stored github.com token from your keychain/credential manager, or run:

```bash
git credential reject
protocol=https
host=github.com
# press Enter twice
```

## Notes
- This script is for HTTPS remotes like `https://github.com/user/repo.git`.
- If you prefer SSH keys instead of HTTPS tokens, you can ignore this script and stick with SSH config.
