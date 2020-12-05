# Helm Charts for Confluent Platform and additional components
This repository contains Helm Charts for the deployment of Confluent Platform components on a Minikube cluster.

## Prerequisites
* Install Minikube:
To use Minikube, a Hypervisor (e.g. VirtualBox) or Docker is needed. Perform the steps of the [installation guide](http://www.minikube.sigs.k8s.io/docs/start/) until the second step according to your operating system.
Start a minikube cluster:
```
minikube start 
```
* Install [kubectl](https://www.kubernetes.io/de/docs/tasks/tools/install-kubectl/#kubectl-installieren).

* Install [Helm](https://www.helm.sh/docs/intro/install/).

* Change into the directory where you want to clone the project to and download it:
```
git clone https://github.com/chargeiq/chargeiq-kafka-kubernetes
```

## Quickstart
To install helm charts in the ./charts/ subdirectory:
```
helm install <release-name> <./path/to/charts>
```
Show all pods:
```
kubectl get pods
```
Uninstall a chart:
```
helm unimstall <release-name>
```
Stop minikube:
```
minikube stop
```
Delete minikube:
```
minikube delete
```

