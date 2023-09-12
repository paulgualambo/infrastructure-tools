# KUBERNETES

## Master kubernetes

es un conjunto de tres daemons que se ejecutan en un único nodo del cluster, que se denomina nodo master.

kube-apiserver
kube-controller-manager
kube-scheduler


kubelet : se comunica con el Master de Kubernetes
kube-proxy : un proxy de red que implementa los servicios de red de Kubernetes en cada nodo

## Objetos de kubernetes

Diferentes abstracciones que representan el estado del sistema:
Aplicaciones contenerizadas desplegadas
Cargas de trabajo
recursos de red
almacenamientos

API Kubernetes

Pod
Service
Volumen
Namespace

Abastracciones de nivel superior Controladores
ReplicaSet
Deployment
StatefulSet
DaemonSet
Job

## Plano de control de Kubernetes

Componentes
Master de Kubernetes
Kubelet (proceso) kubernetes se comunican con el cluster
Mantiene un registro de todos los objetos de kubernetes presentes en el sistema
Continuos bucles de control para gestionar el estado de los mismos

El Master de Kubernetes es el responsable de mantener el estado deseado del cluster
kubectl se comunica con el master del cluster de kubernetes