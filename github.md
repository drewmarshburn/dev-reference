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
 
