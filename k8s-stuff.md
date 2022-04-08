## ExternalSecrets Operator

Force an ES reconciliation:

```
kubectl annotate es NAME force-sync=$(date +%s) --overwrite
```

## Nginx Ingress

### 503 Not Found

If you've enabled basic auth on the `Ingress`, check the associated `Secret`. This error can be thrown when the basic auth `Secret` is not able to be found.