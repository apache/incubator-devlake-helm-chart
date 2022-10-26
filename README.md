# Apache Incubator DevLake Helm Chart

<!--
#
# Licensed to the Apache Software Foundation (ASF) under one or more
# contributor license agreements.  See the NOTICE file distributed with
# this work for additional information regarding copyright ownership.
# The ASF licenses this file to You under the Apache License, Version 2.0
# (the "License"); you may not use this file except in compliance with
# the License.  You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
-->

## Install

To install the chart with release name `devlake`:

```shell
helm repo add devlake https://apache.github.io/incubator-devlake-helm-chart
helm repo update
helm install devlake devlake/devlake
kubectl port-forward service/devlake-ui  30090:32001
kubectl port-forward service/devlake-grafana  30091:32002
```
Then you can visit:
    config-ui by url `http://YOUR-NODE-IP:30090`
    grafana by url `http://YOUR-NODE-IP:30091`

## Update

```shell
helm repo update
```

## Uninstall

To uninstall/delete the `devlake` release:

```shell
helm uninstall devlake
```
