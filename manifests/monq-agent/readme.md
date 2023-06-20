# Манифесты для запуска агента Monq в Kubernetes

* Устанавливает Monq agent ([monq.ru](https://monq.ru)) в кластер Kubernetes

## Установка при помощи манифеста

Установите Monq-agent в качестве развертывания (Deployment) на ваш кластер Kubernetes, применив манифест:

```bash
export MONQ_URI="https://monq.mydomain.com"
export MONQ_KEY="<my coordinator key>"

curl https://raw.githubusercontent.com/MONQDL/monq-agent/master/manifests/monq-agent/monq-agent.yaml -o monq-agent.yaml 

envsubst < monq-agent.yaml | kubectl apply -f -
```

Этот манифест также создает ClusterRole, ClusterRoleBinding, ServiceAccount и Secret для работы с компонентами кластера.