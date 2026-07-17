# git cheat sheets

## Repository Setup

| Command                                           | Usage                        |
| ------------------------------------------------- | ---------------------------- |
| `git init`                                        | Create a new Git repository  |
| `git clone <url>`                                 | Download existing repository |
| `git config --global user.name "John"`            | Set username                 |
| `git config --global user.email "john@gmail.com"` | Set email                    |
| `git config --list`                               | View Git configuration       |

## File Operations

| Command                  | Usage                 |
| ------------------------ | --------------------- |
| `git status`             | Check file status     |
| `git add file.txt`       | Add a specific file   |
| `git add .`              | Add all files         |
| `git restore file.txt`   | Discard local changes |
| `git rm file.txt`        | Delete file from Git  |
| `git mv old.txt new.txt` | Rename file           |

## Commit Operations

| Command                    | Usage                        |
| -------------------------- | ---------------------------- |
| `git commit -m "message"`  | Create commit                |
| `git commit -am "message"` | Add tracked files and commit |
| `git commit --amend`       | Modify last commit           |
| `git log`                  | View commit history          |
| `git log --oneline`        | Short history                |
| `git show`                 | Show commit details          |

## Branch Operations ( here `feature` is the branch name )

| Command                 | Usage                   |
| ----------------------- | ----------------------- |
| `git branch`            | List branches           |
| `git branch feature`    | Create branch           |
| `git switch feature`    | Switch branch           |
| `git switch -c feature` | Create and switch       |
| `git checkout feature`  | Switch branch (old way) |
| `git branch -d feature` | Delete branch           |
| `git branch -D feature` | Force delete branch     |

## Remote Repository

| Command                       | Usage                 |
| ----------------------------- | --------------------- |
| `git remote -v`               | View remotes          |
| `git remote add origin <url>` | Add remote            |
| `git push origin main`        | Push code             |
| `git pull origin main`        | Pull latest code      |
| `git fetch`                   | Download changes only |
| `git clone <url>`             | Clone repository      |

## Merge & Rebase

| Command                 | Usage                 |
| ----------------------- | --------------------- |
| `git merge feature`     | Merge feature branch  |
| `git rebase main`       | Rebase current branch |
| `git rebase --continue` | Continue rebase       |
| `git merge --abort`     | Cancel merge          |
| `git rebase --abort`    | Cancel rebase         |

## Undo Commands

| Command                         | Usage                       |
| ------------------------------- | --------------------------- |
| `git restore file.txt`          | Undo file changes           |
| `git restore --staged file.txt` | Remove from staging         |
| `git reset --soft HEAD~1`       | Remove commit, keep changes |
| `git reset --mixed HEAD~1`      | Remove commit and unstage   |
| `git reset --hard HEAD~1`       | Remove commit and changes   |
| `git revert <commit-id>`        | Create reverse commit       |

## Stash Commands

| Command           | Usage                    |
| ----------------- | ------------------------ |
| `git stash`       | Save temporary changes   |
| `git stash list`  | View stash list          |
| `git stash pop`   | Restore and remove stash |
| `git stash apply` | Restore stash            |
| `git stash drop`  | Delete stash             |
| `git stash clear` | Delete all stashes       |

## diff commands

| Command                    | Usage                  |
| -------------------------- | ---------------------- |
| `git diff`                 | Compare changes        |
| `git diff --staged`        | Compare staged changes |
| `git diff main feature`    | Compare branches       |
| `git diff commit1 commit2` | Compare commits        |

## most used

| Step             | Command                   |
| ---------------- | ------------------------- |
| Check changes    | `git status`              |
| Add files        | `git add .`               |
| Commit           | `git commit -m "message"` |
| Pull latest code | `git pull origin main`    |
| Push code        | `git push origin main`    |

## branch workflow

| Step          | Command                         |
| ------------- | ------------------------------- |
| Create branch | `git switch -c login-feature`   |
| Work on code  | Edit files                      |
| Add changes   | `git add .`                     |
| Commit        | `git commit -m "Added login"`   |
| Push branch   | `git push origin login-feature` |
| Merge to main | `git merge login-feature`       |

--- 

| Area                        | Command               |
| --------------------------- | --------------------- |
| Working Directory → Staging | `git add .`           |
| Staging → Repository        | `git commit -m "msg"` |
| Repository → Remote         | `git push`            |
| Remote → Repository         | `git pull`            |

| File          | Purpose                |
| ------------- | ---------------------- |
| `.gitignore`  | Ignore files/folders   |
| `.git/config` | Repository config      |
| `.git/HEAD`   | Current branch pointer |
| `.git/index`  | Staging area           |
| `.git/logs`   | Git history logs       |
