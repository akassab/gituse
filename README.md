# gituse

A simple helper to switch between multiple GitHub accounts (work, personal, client, etc.)  
It updates your global Git identity so your commits and pushes use the right account — automatically setting your name, email, and credential username.

---

## 🚀 Setup

1. Save `gituse.sh` somewhere (e.g. `~/scripts/gituse.sh`).
2. Add this to your shell config (`~/.bashrc` or `~/.zshrc`):
   ```bash
   source ~/scripts/gituse.sh
   ```
3. Reload your shell:
   ```bash
   source ~/.bashrc
   # or
   source ~/.zshrc
   ```

---

## 🧠 Usage

Switch to your personal account:
```bash
gituse personal
```
Switch to your work account:
```bash
gituse work
```
Switch to your client account:
```bash
gituse client
```

You’ll immediately see which profile is active, and any new commits will use the correct name, email, and credentials.

---

## 🔍 Verification

You can verify your active identity anytime:
```bash
git config --global user.name
git config --global user.email
git config --global credential.username
```

---

## ⚙️ How it works

- `gituse personal` sets your **personal** Git identity (name, email, username)
- `gituse work` sets your **work** Git identity
- `gituse client` sets your **client** Git identity

If you push to GitHub via HTTPS, these credentials ensure the correct account is used.  
If you use SSH, note that GitHub identifies you by your SSH key, not by your Git config.

---

## ✅ Example

```bash
gituse personal
git config user.email
# -> your_personal_email@example.com

git commit -m "Update README"
git push
# Commit will appear under your personal GitHub account (akassab)
```

---

## 🧩 Notes

If your commits don't link to your GitHub account, make sure the **email address** in your commit is verified in the GitHub account you're trying to use.
