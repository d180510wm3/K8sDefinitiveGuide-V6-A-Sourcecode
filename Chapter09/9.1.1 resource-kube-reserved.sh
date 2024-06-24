# �޸�kubelet��systemd���������ļ�����
# cat /usr/lib/systemd/system/kubelet.service
[Unit]
Description=kubelet: The Kubernetes Node Agent
Documentation=https://kubernetes.io/docs/
Wants=network-online.target
After=network-online.target
[Service]
Slice=kubeonly.slice
ExecStart=/usr/bin/kubelet
Restart=always
StartLimitInterval=0
RestartSec=10
[Install]
WantedBy=multi-user.target

# ����kubelet����
systemctl daemon-reload
systemctl restart kubelet.service



# �޸�kubelet�����ļ�������������kube-reservedԤ����Դ�������Ϣ
---
kind: KubeletConfiguration
cgroupDriver: systemd
volumeStatsAggPeriod: 0s
enforceNodeAllocatable:
  - pods
  - kube-reserved
kubeReserved:
  cpu: 500m
  memory: 1Gi
  ephemeral-storage: 1Gi
kubeReservedCgroup: /kubeonly



# ����system-reservedԤ����Դ
# �޸�kubelet�����ļ��е��������
---
kind: KubeletConfiguration
cgroupDriver: systemd
volumeStatsAggPeriod: 0s
enforceNodeAllocatable:
  - pods
  - kube-reserved
  - system-reserved
kubeReserved:
  cpu: 500m
  memory: 1Gi
  ephemeral-storage: 1Gi
kubeReservedCgroup: /kubeonly
systemReserved:
  cpu: 500m
  memory: 1Gi
  ephemeral-storage: 1Gi
systemReservedCgroup: /system

# ����kubelet����
systemctl daemon-reload
systemctl restart kubelet.service




# ����Pod�����Ԥ����Դ
---
kind: KubeletConfiguration
evictionSoft:
  memory.available: 300Mi
  nodefs.available: 1Gi
  imagefs.available: 1Gi
evictionSoftGracePeriod:
  memory.available: 1m30s
  nodefs.available: 2m
  imagefs.available: 2m
evictionHard:
  memory.available: 100Mi
  nodefs.available: 500Mi
  nodefs.inodesFree: 5%
  imagefs.available: 500Mi
evictionMinimumReclaim:
  memory.available: 0Mi
  nodefs.available: 100Mi
  imagefs.available: 200Mi
evictionMaxPodGracePeriod: 30
