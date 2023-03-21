- Unstage a file:
  - `git reset [path]`

- Undo a commit but leave files untouched:
  -  `git reset HEAD~`

- Amend a commit to sign it:
  - `git commit --amend -s` 

- Add a remote and checkout a branch from it:
  - `git remote add hyperledger https://github.com/hyperledger/firefly-ethconnect.git`
  - `git fetch hyperledger`
  - `git checkout -b example hyperledger/main` 

Git reset when submodules are around:
```
git reset --hard origin/whatever
git submodule update --init --recursive
```

## Rebasing

- Rebase against upstream: `git rebase upstream/branch`

## Credentials

- See what credential store is being used: `git config --get credential.helper`
- `store` means Github is just writing creds to `~/.git-credentials`
  - Thus, you can just delete `~/.git-credentials` to force git to prompt for your password.
- `osxkeychain` means Github is using the Keychain Access application to store the creds
  -  Open Keychain Access on your mac (you can use spotlight)
  - Search for github.com
  - Select the github.com keychain item
  - Edit or delete your GitHub account credentials.
