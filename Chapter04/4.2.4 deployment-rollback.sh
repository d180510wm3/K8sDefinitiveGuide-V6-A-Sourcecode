# ��鲿�����Deployment����ʷ��¼
kubectl rollout history deployment/nginx-deployment

# �鿴�ض��汾����ϸ��Ϣ
kubectl rollout history deployment/nginx-deployment --revision=3

# �������η������ع�����һ������汾
kubectl rollout undo deployment/nginx-deployment

# ָ���ع����Ĳ���汾��
kubectl rollout undo deployment/nginx-deployment --to-revision=2
