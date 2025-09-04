# SOP: How I Run Labs

This SOP ensures labs are reproducible, safe, and well-documented.

## Environment
- Primary OS: Windows 10/11 or macOS; optional Linux VM.
- Tooling: Docker Desktop, Git, a code editor, and week-specific tools.
- Time blocks: 10 hours/week (e.g., Mon 2h, Wed 2h, Thu 2h, Sat 4h).

## Workflow
1. **Plan**: Create an issue using the Weekly Lab template; define goals and deliverables.
2. **Isolate**: Use containers/VMs; avoid touching production devices/accounts.
3. **Execute**: Follow steps; capture screenshots and logs.
4. **Document**: Update the week’s README with Goal → Method → Evidence → Results → What’s Next.
5. **Commit & Tag**: Commit artifacts, reference the issue number, tag releases per week if useful.
6. **Review**: Write a brief retrospective: What worked? What to improve?

## File Hygiene
- No secrets in git: use `.env` or local-only config files in `.gitignore`.
- Use small, anonymized datasets and redact personal info in screenshots.

## Evidence
- Store screenshots in the week folder: `images/`.
- Save key CLI outputs as `.txt` in the week folder.
- Include a short PDF/Markdown report per week when appropriate.
