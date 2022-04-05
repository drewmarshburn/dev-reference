alias cd.='cd ../'
alias cd..='cd ../../'
alias cd...='cd ../../../'
alias cd....='cd ../../../../'
alias cd.....='cd ../../../../../'
alias cd......='cd ../../../../../../'

# Flux
alias fgh="flux get helmreleases -A"
alias fgk="flux get kustomizations -A"
alias fgsg="flux get sources git -A"
alias frsg="flux reconcile source git"
alias fssg="flux suspend source git"
alias frssg="flux resume source git"
alias frh="flux reconcile helmrelease"
alias frk="flux reconcile kustomization"
alias fdh="flux delete helmrelease"
alias fdsg="flux delete source git"
alias fshr="flux suspend helmrelease"
alias frshr="flux resume helmrelease"

# K8s
alias kgp="kubectl get pods -A"
alias kgs="kubectl get services -A"
alias kgj="kubectl get jobs -A"
alias kl="kubectl logs"
alias kgi="kubectl get ingress"
alias kdp="kubectl describe pod"
alias kds="kubectl describe service"
alias kcgc="kubectl config get-contexts"
alias kcuc="kubectl config use-context"
alias curler="kubectl run --overrides='{ \"spec\": { \"securityContext\": { \"runAsUser\": 0 } } }' curler --rm --image=brix4dayz/swiss-army-knife --image-pull-policy=Always -it --restart=Never"

