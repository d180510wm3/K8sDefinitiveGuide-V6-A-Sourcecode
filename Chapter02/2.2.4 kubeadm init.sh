# ��ȡĬ�ϵĳ�ʼ�������ļ�
kubeadm config print init-defaults > init-config.yaml

# ��������ľ���
kubeadm config images list
kubeadm config images pull --config=init-config.yaml




# ����֮ǰ�����������ļ�һ����װMaster
kubeadm init --config=init-config.yaml

# root�û�ͨ����������KUBECONFIG���������ļ���ָ��Ϊ��kubeadm�����������ļ�admin.confȫ·��
export KUBECONFIG=/etc/kubernetes/admin.conf

# ��ͨ�û�����root�����Խ�admin.conf�����ļ����Ƶ��û�HOMEĿ¼��.kube��Ŀ¼�£���������ȷ���ļ�Ȩ��
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config

# ��֤kubectl�ܹ���ȷ����Master
kubectl -n kube-system get configmap
