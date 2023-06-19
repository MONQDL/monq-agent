# Monq Agent Helm Chart

* Installs the Monq agent [monq.ru](https://monq.ru)


## Installing the Chart

[Helm](https://helm.sh) must be installed to use the charts.
Please refer to Helm's [documentation](https://helm.sh/docs/) to get started.

Once Helm is set up properly, install the latest version of chart with the release name `monq-agent`:

```console
kubectl create namespace monq
helm upgrade --install monq-agent monq-agent --repo https://github.io/MONQDL/monq-agent --namespace monq --create-namespace \
--set config.baseUri="https://monq.mydomain.com" --set config.apiKey="<my coordinator key>"
```

## Uninstalling the Chart

To uninstall/delete the monq-agent deployment:

```console
helm delete monq-agent -n monq
```

The command removes all the Kubernetes components associated with the chart and deletes the release.

## Configuration
| Key                         | Type   | Default                        | Description                                                                                                                                                             |
|:----------------------------|:-------|:-------------------------------|:------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `config.baseUri`            | string | ``                             | Monq instance FQDN                                                                                                                                                      |
| `config.apiKey`             | string | ` `                            | Coordinator API key of instance                                                                                                                                         |
| `config.fileStorage`        | string | ` `                            | Path to agent file storage                                                                                                                                              |
| `config.timeout`            | int    | `100`                          | Timeout for connecting to instance                                                                                                                                      |
| `config.pluginsPath`        | string | `agent-plugins`                | Path to directory containing plugins                                                                                                                                    |
| `config.retryCount`         | int    | `10`                           | Number of times to retry connection to instance                                                                                                                         |
| `config.slotsCount`         | int    | `2`                            | Number of agent slots                                                                                                                                                   |
| `replicas`                  | int    | `1`                            | Number of replicas                                                                                                                                                      |
| `image.repository`          | string | `ghcr.io/MONQDL`               | Container image repository                                                                                                                                              |
| `image.name`                | string | `monq-agent`                   | Container image name                                                                                                                                                    |
| `image.pullPolicy`          | string | `IfNotPresent`                 | Image Pull policy                                                                                                                                                       |
| `image.tag`                 | string | `nil`                          | Image tag, use AppVersion if undefined.                                                                                                                                 |
| `imagePullSecrets`          | list   | `[]`                           | Optional array of imagePullSecrets containing private registry credentials # Ref: https://kubernetes.io/docs/tasks/configure-pod-container/pull-image-private-registry/ |
| `resources.limits.cpu`      | string | `nil`                          | CPU limits                                                                                                                                                              |
| `resources.limits.memory`   | string | `nil`                          | Memory limits                                                                                                                                                           |
| `resources.requests.cpu`    | string | `100m`                         | CPU requests                                                                                                                                                            |
| `resources.requests.memory` | string | `128Mi`                        | Memory requests                                                                                                                                                         |
| `nodeSelector `             | object | `{"kubernetes.io/os":"linux"}` | Node labels for default backend pod assignment # Ref: https://kubernetes.io/docs/user-guide/node-selection/ #                                                           |