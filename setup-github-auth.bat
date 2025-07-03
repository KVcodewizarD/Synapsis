REM filepath: d:\Synapsis\synapsis-ai-scribe\synapsis-ai-scribe-main\setup-github-auth.bat
@echo off
echo ========================================
echo Setting up GitHub Authentication
echo ========================================
echo.

echo This script will help you set up GitHub authentication.
echo You'll need to create a Personal Access Token (PAT) on GitHub.
echo.
echo 1. Go to: https://github.com/settings/tokens
echo 2. Click "Generate new token"
echo 3. Give it a name like "Synapsis AI Scribe"
echo 4. Select repo, workflow, and user scopes
echo 5. Generate and copy the token
echo.
set /p TOKEN="Enter your GitHub Personal Access Token: "

echo.
echo Setting up credentials...
echo machine github.com > %USERPROFILE%\.git-credentials
echo login %TOKEN% >> %USERPROFILE%\.git-credentials
echo password x-oauth-basic >> %USERPROFILE%\.git-credentials

git config --global credential.helper store
git config --global user.name "KVcodewizarD"
set /p EMAIL="Enter your GitHub email: "
git config --global user.email %EMAIL%

echo.
echo Authentication setup complete!
echo You can now run push-to-github.bat to push your changes.
echo ========================================
pause