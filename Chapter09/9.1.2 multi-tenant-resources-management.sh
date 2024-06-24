# Ϊ��ͬ�⻧���ò�ͬ�Ļ���
# namespace-development.yaml
apiVersion: v1
kind: Namespace
metadata:
  name: development

# namespace-production.yaml
apiVersion: v1
kind: Namespace
metadata:
  name: production



# Ϊ�����⻧�ֱ���һ�����л�����context���������������Ե������ռ�
kubectl config set-context ctx-dev --namespace=development --cluster=kubernetes-cluster --user=dev

kubectl config set-context ctx-prod --namespace=production --cluster=kubernetes-cluster --user=prod


# ����ǰ���л�������Ϊctx-dev
kubectl config use-context ctx-dev





# Ϊ�⻧�����û�����API Server�Ŀͻ���CA֤��

# 1. �����û���˽Կ��֤��
openssl genrsa -out dev.key 2048
openssl req -new -key dev.key -out dev.csr

# 2. ��Kubernetes��CA��֤�����ǩ��
openssl x509 -req -in dev.csr -CA /etc/kubernetes/pki/ca.crt -CAkey /etc/kubernetes/pki/ca.key -CAcreateserial -out dev.crt -days 500

# 3. ��kubeconfig������dev�û�֤����Ϣ
kubectl config set-credentials dev --client-certificate=/root/dev.crt --client-key=/root/dev.key

# 4. ȷ��dev�û�֤����Ϣ�Ѿ��������
kubectl config view
users:
- name: dev
  user:
    client-certificate: /root/dev.crt
    client-key: /root/dev.key


# ��dev�û�������Ȩ�����л�������Ա��context
kubectl config use-context kubernetes-admin@kubernetes

# ����development�⻧��role�����󶨵��û�dev��
# 1. ����Role
# develement-role.yaml
apiVersion: rbac.authorization.k8s.io/v1
kind: Role
metadata:
  namespace: development
  name: development-role
rules:
- apiGroups: ["", "extensions", "apps"]
  resources: ["deployments","configmaps","secrets","deamonsets","statefulset","pods", "services","jobs"]
  verbs: ["get", "list", "watch", "create", "update", "patch", "delete"]

kubectl create -f develement-role.yaml

# 2. ����RoleBinging����dev�û���Ȩdevelopment-role�Ľ�ɫ
# development-role-binding.yaml
apiVersion: rbac.authorization.k8s.io/v1
kind: RoleBinding
metadata:
  name: development-role-binding
  namespace: development
subjects:
- kind: User
  name: dev
  apiGroup: rbac.authorization.k8s.io
roleRef:
  kind: Role
  name: development-role
  apiGroup: rbac.authorization.k8s.io

kubectl create -f development-role-binding.yaml

# �л���ctx-dev��������֤dev�û��������������ռ��й�����Դ
kubectl config use-context ctx-dev
kubectl get pods

