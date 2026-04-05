#!/bin/bash

echo "Starting port forwarding for Monitoring Stack..."

# Namespace
NAMESPACE="monitoring-yablonskyi"  # <- замініть на своє прізвище / namespace

# 1️⃣rafana -> Port 8000
nohup kubectl port-forward svc/monitoring-stack-grafana 8080:80 -n monitoring-yablonskyi --address 0.0.0.0 > /dev/null 2>&1 &
echo " -> Grafana exposed on port 8080"

# 2️⃣rometheus -> Port 908001
nohup kubectl port-forward svc/monitoring-stack-kube-prom-prometheus 8000:9090 -n monitoring-yablonskyi --address 0.0.0.0 > /dev/null 2>&1 &
echo " -> Prometheus exposed on port 8000"

# 3️⃣lertmanager -> Port 908002
nohup kubectl port-forward svc/monitoring-stack-kube-prom-alertmanager 8001:9093 -n monitoring-yablonskyi --address 0.0.0.0 > /dev/null 2>&1 &
echo " -> Alertmanager exposed on port 8001"

echo "Port forwarding started. Access your services via http://<VM-IP>:80, 8000, 8001"
