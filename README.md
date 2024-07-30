```text
     _.._
 __d'_, `.
  /    ) )    StrongSwan
      / /     Kubernetes
     / /      Proof of Concept
    / /_..-====-..__
   / Y           `_=
  ( (         _.-"
  (   `-===-'" `"=-
   `._________.-"
```

## About

This is a proof of concept that demostrates how to establish pod-to-pod
IPSec connections using StrongSwan in Kubernetes.

## Quick Start

Make sure you have `SecretStrongSwanCerts.yaml` prefilled in the `./k8s` 
directory. There is a sample file `SecretStrongSwanCerts.yaml.sample` that
you can use as a template.

First create the PVC:

```bash
cd k8s
kubectl apply -f SharedVolumeClaim.yaml
```

Then deploy the rest of the cluster:

```bash
cd k8s
kubectl apply -f .
``` 

Shell into any of the pods, you will see several scripts.

```bash
root@strongswan-pod1-7666dbf567-z949g:/# ls / | grep .sh
load.sh
start.sh
status.sh
tunnel.sh
```
Then do these in order in both of the pods:

* Execute `sh start.sh` to start IPSec.
* Execute `sh load.sh` to load the configuration.
* Execute `sh tunnel.sh` to connect to the other pod.
* Execute `sh status.sh` to check the status of the connection.
