# Week 1 — Lab & Portfolio Setup

This week you will:
- Initialize the portfolio repo
- Add safety/ethics docs
- Set up (optional) baseline Windows logging
- Create a GitHub Project board and issue templates

## 1) Initialize the repo
```bash
git init
git add .
git commit -m "Week 1: initialize portfolio skeleton"
# Create a new empty repo on GitHub (without README) then:
git remote add origin <YOUR_GITHUB_REPO_URL>
git branch -M main
git push -u origin main
```

## 2) (Optional) Install Docker Desktop
- Windows/macOS: Install Docker Desktop, ensure it starts.
- Verify:
```bash
docker run hello-world
```

## 3) Baseline Windows logging (Windows only)
Run PowerShell **as Administrator** and execute:
```powershell
Set-ExecutionPolicy RemoteSigned -Scope LocalMachine -Force
cd .\01-setup\scripts
.\enable-windows-logging.ps1
.erify-logging.ps1
```
Reboot recommended after enabling. See script comments for what is configured.

## 4) Create a GitHub Project board
- Go to your GitHub repo → Projects → “New project” → Template: Board (Kanban).
- Columns: Backlog, In Progress, Review, Done.
- Create a “Week 1” card and link the issue created via the **Weekly Lab** template.

## 5) Deliverables checklist
- [ ] Code of Conduct and Security Policy committed
- [ ] SOP and Ethics docs committed
- [ ] (If Windows) Logging enabled and verified
- [ ] Project board created; Week 1 issue filed
- [ ] Pushed to GitHub
