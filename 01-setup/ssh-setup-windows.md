# SSH Setup on Windows (Ed25519)

## 1) Check OpenSSH
CMD:
```
ssh -V
```
If not found, add "OpenSSH Client" via Optional Features in Settings.

## 2) Generate key (Ed25519)
CMD:
```
ssh-keygen -t ed25519 -a 100 -C "your_email@example.com"
```
Press Enter to accept the default path:
```
C:\Users\<you>\.ssh\id_ed25519
```

## 3) View your public key
CMD:
```
type %USERPROFILE%\.ssh\id_ed25519.pub
```
Copy the entire single-line key (starts with `ssh-ed25519` ...).

## 4) Start SSH agent and add the key
PowerShell (recommended):
```
Get-Service ssh-agent | Set-Service -StartupType Automatic
Start-Service ssh-agent
ssh-add $env:USERPROFILE\.ssh\id_ed25519
```
CMD (service config):
```
sc config ssh-agent start=auto
net start ssh-agent
ssh-add %USERPROFILE%\.ssh\id_ed25519
```

## 5) Add key to GitHub
GitHub > Settings > SSH and GPG keys > New SSH key. Paste the public key from step 3.

To clone via **SSH**, use the "Code" dropdown and switch the tab from HTTPS to SSH, then copy the `git@github.com:...` URL.

## 6) Test
```
ssh -T git@github.com
```
You should see a greeting like:
```
Hi <username>! You've successfully authenticated...
```
