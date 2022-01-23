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

## Rebasing

- Rebase against upstream: `git rebase upstream/branch`

## Credentials

- See what credential store is being used: `git config --get credential.helper`
- `store` means Github is just writing creds to `~/.git-credentials`
- Thus, you can just delete `~/.git-credentials` to force git to prompt for your password.
