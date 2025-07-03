@echo off
echo ========================================
echo Pushing all changes to GitHub repository
echo ========================================
echo.

REM Check if git is initialized
if not exist .git (
    echo Initializing git repository...
    git init
    echo.
)

echo Checking Git status...
git status

echo.
echo Adding all files...
git add .

echo.
echo Committing changes...
git commit -m "Enhanced Synapsis AI Scribe with working API integration, interactive Notes, Research Papers, Knowledge Graph with import feature, and Library functionality"

echo.
echo Setting up remote repository (if not already configured)...
git remote -v | findstr "origin" > nul
if %errorlevel% neq 0 (
    git remote add origin https://github.com/KVcodewizarD/synapsis-ai-scribe-main.git
    echo Remote repository added.
) else (
    echo Remote repository already configured.
)

echo.
echo First, let's try pulling latest changes to avoid conflicts...
git pull origin main --allow-unrelated-histories
echo.

echo Trying to push to GitHub...
git push -u origin main
if %errorlevel% neq 0 (
    echo.
    echo Push failed. This could be due to repository rules or conflicts.
    echo.
    echo Options:
    echo 1. Try pushing to a new branch instead of main
    echo 2. Create a pull request from your branch to main
    echo.
    
    set /p choice="Would you like to try pushing to a new branch? (y/n): "
    if /i "%choice%"=="y" (
        set /p branch="Enter new branch name: "
        echo.
        echo Creating and pushing to branch: %branch%
        git checkout -b %branch%
        git push -u origin %branch%
        echo.
        echo If successful, go to GitHub and create a pull request from %branch% to main.
        echo Pull request URL: https://github.com/KVcodewizarD/synapsis-ai-scribe-main/compare/%branch%...main
    ) else (
        echo.
        echo You can try to:
        echo 1. Contact the repository owner to disable branch protection rules
        echo 2. Create a new repository without protection rules
    )
)

echo.
echo ========================================
echo Process completed!
echo ========================================
pause