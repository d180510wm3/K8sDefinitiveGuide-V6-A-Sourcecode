# completions=4����ʾ��Ҫ���4������
apiVersion: batch/v1
kind: Job
metadata:
  name: job-sleep5
spec:
  completions: 4
  backoffLimit: 4
  template:
    spec:
      containers:
      - name: hello
        image: busybox
        imagePullPolicy: IfNotPresent
        command: ["sh", "-c", "echo hello && sleep 10"]
      restartPolicy: Never



# ����suspend=true������Job
kubectl patch job/job-sleep5 --type=strategic --patch '{"spec":{"suspend":true}}'


# �ָ�Job������״̬
kubectl patch job/job-sleep5 --type=strategic --patch '{"spec":{"suspend":false}}'
