# ��ͣDeployment�ĸ��²���
kubectl rollout pause deployment/nginx-deployment

# ������������Դ��������
kubectl set resources deployment nginx-deployment -c=nginx --limits=cpu=200m,memory=512Mi

# �ָ����Deployment�Ĳ������
kubectl rollout resume deploy nginx-deployment
