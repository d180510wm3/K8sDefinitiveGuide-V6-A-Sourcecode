# �鿴DaemonSet����ʷ�汾
kubectl -n kube-system rollout history daemonset fluentd

# �鿴�ض��汾����ϸ��Ϣ
kubectl -n kube-system rollout history daemonset fluentd --revision=1

# ��DaemonSet�ع�����һ���汾
kubectl -n kube-system rollout undo daemonset fluentd

# ָ����Ҫ�ع����İ汾��
kubectl -n kube-system rollout undo daemonset fluentd --to-revision=2

# ��ִ���������õ�CHANGE-CAUSE�ֶ���
kubectl create -f fluentd-ds.yaml --record=true
