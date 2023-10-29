
# Skalerun Kubelabs

Deploy a GCP CompueEngine Kubernetes Clusters.

## Install Engine

<https://docs.docker.com/engine/install/debian/>

## Insall cGroups

<https://kubernetes.io/docs/setup/production-environment/container-runtimes/>

## Install kubeadm

<https://kubernetes.io/docs/setup/production-environment/tools/kubeadm/install-kubeadm/>

```shell
# Enable kubeadmin
sudo apt-get update
sudo apt-get install -y kubelet=1.23.0-00 kubeadm=1.23.0-00 kubectl=1.23.0-00
sudo apt-mark hold kubelet kubeadm kubectl
```

```shell
# Enable kubeconfig
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config
```
