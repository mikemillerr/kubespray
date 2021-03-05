#!/bin/bash

root_dir="$( cd "$( dirname $0 )" && pwd )"

RELEASE="v1.20.4"
CNI_VERSION="v0.9.0"
CRICTL_VERSION="v1.20"
CALICO_CTL_VERSION="v3.16.8"
ETCD_VERSION="v3.4.14"

DOWNLOAD_DIR=${root_dir}/kubernetes/
mkdir -p  $DOWNLOAD_DIR/${RELEASE}/
cd $DOWNLOAD_DIR/${RELEASE}/
curl -L --remote-name-all "https://storage.googleapis.com/kubernetes-release/release/${RELEASE}/bin/linux/amd64/{kubeadm,kubelet,kubectl}"
if [[ $? -ne 0 ]]; then
  echo "Error in downloading the kube binaries"
fi

mkdir -p  $DOWNLOAD_DIR/etcd/
cd $DOWNLOAD_DIR/etcd/
curl -L --remote-name-all "https://github.com/coreos/etcd/releases/download/${ETCD_VERSION}/etcd-${ETCD_VERSION}-linux-amd64.tar.gz"
if [[ $? -ne 0 ]]; then
  echo "Error in downloading the etcd binaries"
fi

mkdir -p $DOWNLOAD_DIR/cni/
cd $DOWNLOAD_DIR/cni/
curl -L --remote-name-all "https://github.com/containernetworking/plugins/releases/download/${CNI_VERSION}/cni-plugins-linux-amd64-${CNI_VERSION}.tgz"
if [[ $? -ne 0 ]]; then
  echo "Error in downloading the cni-plugins binaries"
fi

mkdir -p $DOWNLOAD_DIR/cri-tools
cd $DOWNLOAD_DIR/cri-tools
curl -L --remote-name-all "https://github.com/kubernetes-sigs/cri-tools/releases/download/${CRICTL_VERSION}/crictl-${CRICTL_VERSION}-linux-amd64.tar.gz"
if [[ $? -ne 0 ]]; then
  echo "Error in downloading the cri-tools binaries"
fi

mkdir -p $DOWNLOAD_DIR/calico/
cd $DOWNLOAD_DIR/calico/
curl -L --remote-name-all "https://github.com/projectcalico/calicoctl/releases/download/${CALICO_CTL_VERSION}/calicoctl-linux-amd64"
if [[ $? -ne 0 ]]; then
  echo "Error in downloading the calico binaries"
fi

mkdir -p $DOWNLOAD_DIR/helm/
cd $DOWNLOAD_DIR/helm/
curl -L --remote-name-all "https://get.helm.sh/helm-${HELM_VERSION}-linux-amd64.tar.gz"
if [[ $? -ne 0 ]]; then
  echo "Error in downloading the helm binaries"
fi
