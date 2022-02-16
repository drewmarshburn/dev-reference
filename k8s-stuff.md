## ExternalSecrets Operator

Force an ES reconciliation:

```
kubectl annotate es NAME force-sync=$(date +%s) --overwrite
```
