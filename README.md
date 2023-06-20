# Monq-agent

Репозиторий содержит:
- Dockerfile для сборки образа агента Monq
- Helm чарт для установки агента Monq (смотрите [описание чарта](charts/monq-agent/README.md) для получения детальной информации)
- Манифесты для запуска агента в Kubernetes вручную (смотрите [описание манифестов](manifests/monq-agent/readme.md) для получения детальной информации)

Используя Helm, вы можете установить агент Monq следующей командой:
```bash
kubectl create namespace monq

helm upgrade --install monq-agent monq-agent --repo https://monqdl.github.io/monq-agent --namespace monq \
--set config.baseUri="https://monq.mydomain.com" --set config.apiKey="<my coordinator key>"

```

Или используя манифесты Kubernetes, применить их вручную:

```bash
export MONQ_URI="https://monq.mydomain.com"
export MONQ_KEY="<my coordinator key>"

curl https://raw.githubusercontent.com/MONQDL/monq-agent/master/manifests/monq-agent/monq-agent.yaml -o monq-agent.yaml 

envsubst < monq-agent.yaml | kubectl apply -f -
```