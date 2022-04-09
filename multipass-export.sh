multipass info k3sVM
# Export the IP address
K3S_IP=$(multipass info k3sVM | grep IPv4 | awk '{print $2}')
# export `kubeconfig` file
multipass exec k3sVM sudo cat /etc/rancher/k3s/k3s.yaml > k3s.yaml
# replace the ip adress with the external
sed -i '' "s/127.0.0.1/${K3S_IP}/" k3s.yaml
# set KUBECONFIG
export KUBECONFIG=${PWD}/k3s.yaml

cat ${PWD}/k3s.yaml
