# ΪDeployment�����µľ�������
kubectl set image deployment/nginx-deployment nginx=nginx:1.9.1

kubectl edit deployment/nginx-deployment

# �鿴Deployment�ĸ��¹���
kubectl rollout status deployment/nginx-deployment

# �鿴Deployment nginx-deployment����ϸ�¼���Ϣ
kubectl describe deployments/nginx-deployment
