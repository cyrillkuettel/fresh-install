# Some nice git commands

```console
# git add and commit at the same time  
git config --global alias.add-commit '!git add -A && git commit'  
# and use it with  
git add-commit -m 'My commit message'

git config --global alias.adog "log --all --decorate --oneline --graph"
# Show the diff after pulling n commits

git diff HEAD~n...origin/master

# or just copy the alias to ~/.gitconfig

[alias]
    searchall = "!f() { git log --all --full-history -- \"$1^\"; }; f"
    adog = log --all --decorate --oneline --graph
    
    # Show all files of a commit:
    showfiles = "!f() { git diff-tree --no-commit-id --name-only -r \"$1\"; }; f"
    
    # search all history, for when a specific string was added
    whataddedstring = "!f() { git log -S \"$1\" --source --all; }; f"

```


