# ����������ʽ
---
apiVersion: v1
kind: Service
metadata:
  name: webapp
spec:
  ports:
  - protocol: TCP
    port: 8080
    targetPort: 8080
  selector:
    app: webapp

curl http://${WEBAPP_SERVICE_HOST}:${WEBAPP_SERVICE_PORT}




# DNS��ʽ
---
apiVersion: v1
kind: Service
metadata:
  name: webapp
spec:
  ports:
  - protocol: TCP
    port: 8080
    targetPort: 8080
    name: http
  selector:
    app: webapp


nslookup -q=srv _http._tcp.webapp.default.svc.cluster.local
