## ExternalSecrets Operator

Force an ES reconciliation:

```
kubectl annotate es NAME force-sync=$(date +%s) --overwrite
```

## Job from CronJob

`kubectl create job --from=cronjob/appcloud-logs-ism ism-test -n kube-system`

## Nginx Ingress

### 503 Not Found

If you've enabled basic auth on the `Ingress`, check the associated `Secret`. This error can be thrown when the basic auth `Secret` is not able to be found.

## Dump Halm Values in Configmap

```
apiVersion: v1
kind: ConfigMap
metadata:
  name: values-dump
data: 
  values: |
{{ .Values | toPrettyJson | indent 4 }}
```
## Mongo

Mongo pod:
`kubectl run --rm mongo --image=mongo:latest --image-pull-policy=Always -it --restart=Never -- /bin/sh`

Connect to mongo (assuming the service is named `mongodb.databases`):
`mongo --host mongodb://mongodb.databases:27017/`
