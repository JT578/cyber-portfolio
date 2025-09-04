# Git Setup

## Identity
```
git config --global user.name "Your Name"
git config --global user.email "your_email@example.com"
```

## Defaults that save time
```
git config --global init.defaultBranch main
git config --global pull.rebase false
git config --global core.autocrlf input
git config --global fetch.prune true
```

## New repo (local), then push via SSH
```
mkdir my-college-repo
cd my-college-repo
git init
echo "# My College Repo" > README.md
git add .
git commit -m "init: repo scaffold"
git remote add origin git@github.com:<your-username>/<your-repo>.git
git push -u origin main
```
If you already have a remote repo, just set `origin` and push.
