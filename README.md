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

Thanks to @matrixji who initiated all content in `apache/incubator-devlake`, this repo is copied from directory deployment/helm in repo `apache/incubator-devlake`! Also thanks to @lshmouse, @shubham-cmyk and @SnowMoon-Dev for the contribution for devlake helm deployment.

## Install

To install the chart with release name `devlake`:

```shell
helm repo add devlake https://apache.github.io/incubator-devlake-helm-chart
helm repo update
helm install devlake devlake/devlake --version=0.15.1-beta5
```

If you are using minikube inside your mac, please use the following command to forward the port:
```shell
kubectl port-forward service/devlake-ui  30090:4000
```
and open another terminal:
```shell
kubectl port-forward service/devlake-grafana  30091:3000
```

Then you can visit:
    config-ui by url `http://YOUR-NODE-IP:30090`
    grafana by url `http://YOUR-NODE-IP:30091`

## Update

```shell
helm repo update
helm upgrade --install devlake devlake/devlake --version=0.15.1-beta5
```

## Uninstall

To uninstall/delete the `devlake` release:

```shell
helm uninstall devlake
```

## Original pr in apache/incubator-devlake
https://github.com/apache/incubator-devlake/pulls?q=is%3Apr+helm+is%3Aclosed

## How to upgrade helm chart after releasing new devlake images
1. In [values.yaml](https://github.com/apache/incubator-devlake-helm-chart/blob/main/charts/devlake/values.yaml), change {{ imageTag }} to current image tag
2. In [chart.yaml](https://github.com/apache/incubator-devlake-helm-chart/blob/main/charts/devlake/Chart.yaml), change {{ version }}, {{ appVersion }} to current image tag
3. If we want to release a new chart without new release of devlake, we should increase both chart version and image tag. 
   - For example, right now both versions are 0.15.1-beta3, if we make change on chart, we should set chart-version to 0.15.1-beta4, also, we need to crate new images for devlake with tag 0.15.1-beta4
4. If we release any new image for devlake, we just need to set a new version for chart.

## Original pr in apache/incubator-devlake
https://github.com/apache/incubator-devlake/pulls?q=is%3Apr+helm+is%3Aclosed


## More
You could find more examples and details in [HelmSetup.md](HelmSetup.md)