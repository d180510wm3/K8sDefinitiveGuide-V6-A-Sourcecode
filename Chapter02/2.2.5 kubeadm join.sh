# ��װkubeadm��kubelet
yum install kubelet kubeadm --disableexcludes=kubernetes

# ����kubelet���񣬲�����Ϊ����������
systemctl enable --now kubelet

# ����kubeadm join������뼯Ⱥ����--token���͡�--discovery-token-ca- cert-hash����ֵ��Ҫ�ӳɹ���װMasterʱ����ʾ��Ϣ�и���
kubeadm join 192.168.18.10:6443 --token 2m54ly.s8g4lv2urk0dcuvi \
    --discovery-token-ca-cert-hash sha256:159400c88042d63dc7188db587c81efd1282d4bb16f00d316120ebcd278a333f




# ��ȡĬ������
kubeadm config print join-defaults > join.config.yaml

# ���������ļ�ִ��kubeadm join�����Node���뼯Ⱥ
kubeadm join --config=join.config.yaml




# ��Master��ͨ��kubectl get nodes����ȷ���µ�Node�Ѽ��뼯Ⱥ
kubectl get nodes

# ��Master����ΪNode
kubectl taint nodes --all node-role.kubernetes.io/master-
