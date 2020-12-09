#!/usr/bin/env bash
#bash script for installation of all platform components with helm charts

#minikube start
#minikube addons enable registry

#install components with defined values.yaml file
helm install -f ./deployments/grafana/grafana.values.yaml grafana ./charts/grafana
helm install -f ./deployments/hivemq-operator/hivemq.values.yaml hivemq ./charts/hivemq-operator
helm install -f ./deployments/mongodb/mongodb.values.yaml mongodb ./charts/mongodb
helm install -f ./deployments/postgresql/postgres.values.yaml postgres ./charts/postgresql

#build the custom Kafka Connect image
. ./deployments/confluent-platform/build-connect-image.sh
#push to docker registry
docker push localhost:32777/cp-connect-emob:5.5.0

#install all Confluent components with the values.yaml files defined in ./deployments/confluent-platform
helm install confluent-platform ./charts/confluent-platform $(for file in ./deployments/confluent-platform/*.yaml; do echo "--values $file"; done)

#build image to deploy the connector configurations to Kafka Connect
. ./deployments/deploy/build-deploy-image.sh
#push to docker registry
docker push localhost:32777/cp-deploy-emob:5.5.0

#TO DO: healthcheck for Confluent components and especially Kafka Connect
#install deployment of connector configurations
#helm install connector-deploy ./deployments/deploy/connector-deploy
