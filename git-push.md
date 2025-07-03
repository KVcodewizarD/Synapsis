# Git Commands to Push Changes

Open a terminal/command prompt in your project directory (`d:\Synapsis\synapsis-ai-scribe\synapsis-ai-scribe-main`) and run these commands:

## 0. Initialize Git Repository (if not already done)
```bash
git init
```

## 1. Check Status
```bash
git status
```

## 2. Add All Changed Files
The error you're seeing is because the file paths are using forward slashes but your Windows system might be expecting backslashes, or the files may be in a different location.

### Check Your Directory Structure First

Run this command to see what files actually exist:
```bash
dir /s /b *.tsx
```

### Then Try Adding Files Using Correct Paths

Use backslashes for Windows paths or use quotes:
```bash
git add "d:\Synapsis\synapsis-ai-scribe\synapsis-ai-scribe-main\src\App.tsx"
```

Or use relative paths with backslashes:
```bash
git add .\src\App.tsx .\src\components\Notes\NotesComponent.tsx
```

### Simplest Solution: Add All Changes

The simplest solution is to add all changes at once:
```bash
git add .
```

## 3. Commit Your Changes
Now you can commit:
```bash
git commit -m "Enhanced Synapsis AI Scribe with working API integration, interactive Notes, Research Papers, Knowledge Graph with import feature, and Library functionality"
```

## 4. Set Remote Repository (if not already done)
```bash
git remote add origin https://github.com/KVcodewizarD/synapsis-ai-scribe-main.git
```

## 5. Push to GitHub
```bash
git push -u origin main
```

## Automated Solution to Push All Changes

If you want a single command to add all changes, commit them, and push to GitHub, create a batch file named `push-to-github.bat` with the following content:

```batch
@echo off
echo Pushing all changes to GitHub...
git add .
git commit -m "Updated Synapsis AI Scribe with new features and fixes"
git push -u origin main
echo Done!
pause
```

Then just run this batch file whenever you want to push changes.

## Troubleshooting

### If your files are in a completely different location:
Make sure you're in the correct directory. Check where your .git folder is:
```bash
dir /a:h .git
```

### If you need to reconfigure your repository:
```bash
git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"
```

### If GitHub authentication fails:
Use a Personal Access Token instead of your password.
Create one at: https://github.com/settings/tokens
