# kubernetesExample

## General

This project assumes an available image/container will be used and is accessible to the Kubernetes cluster, either in Docker Hub or a local registry.  This guide will incorporate the image created using the `Kubernetes/dockerExample`, which is contained in this Git repo.  If a basic image is needed, follow the guide for dockerExample and create an image before proceeding, or use a publically available image

There is also the assumption that a working and available Kubernetes cluster is accessible.  If using Morpheus, an MKS cluster can be deployed to on-premises (or public cloud) or an EKS, AKS, or GKE cluster can be deployed as well.  These are the easier to deploy but any should work.

## Architecture Information

This project will create `pods`, which will contain the image created in the `dockerExample` project, or a different image.  This image will be deployed to pods and the pods will be associated with a `ClusterIP`.  The Cluster IP will be used to spread requests to the pods across the nodes.

`Ingress Controllers` will be deployed to all the nodes via a `daemonset`, which will allow reverse proxy for web traffic.  In a production configuration, a `Load Balancer` should be used to load balance traffic to the nodes/ingress controllers.  In this project, we'll simply configure our hosts file to resolve to one worker IP address.

The ideal Kubernetes cluster would have a master node and at least 3 worker nodes.  This is what was used when writing this project but any Kubernetes cluster configuration will suffice.

## Deploy Ingress Controller

The Nginx Ingress Controller will be used in this example, but other alternative Ingress Controllers can be used.

1. Install the `kubectl` tool/command on Windows (or other platform):  
   https://kubernetes.io/docs/tasks/tools/install-kubectl-windows/
2. Ensure access to your Kubernetes cluster is available by configuring your `.kube/config` file
3. Test your cluster connectivity using the following command:  
   `kubectl get nodes`
4. Clone this repository:  
   `git clone https://github.com/entizer/public-morpheus-automation-examples`
5. Navigate to the `Kubernetes/kubernetesExample` directory
6. Run the following command to apply all Kubernetes manifest files in the `ingress` directory:  
   `docker apply -f ./ingress/`

   *Note that these files will be applied in alphabetical order.  Alternatively, each file could be deployed one by one as well.  Although the order may not matter, the files have been labeled for consistency with the documentation:  
   https://docs.nginx.com/nginx-ingress-controller/installation/installation-with-manifests/

## Deploy the test application

1. If not already there, navigate to the `Kubernetes/kubernetesExample` directory
2. Edit the following files in the `testApp` directory, as needed:
   
   * `01-testApp.yaml`
      * Replace `entizer/dockerexample:latest` with your own Docker Image you created
   * `03-testApp-ingress-object.yaml`
      * Replace `k8s.myurl.local` with a different URL, if preferred

3. Run the following command to apply all Kubernetes manifest files in the `ingress` directory
   `docker apply -f ./testApp/`

   *Note that these files will be applied in alphabetical order.  Alternatively, each file could be deployed one by one as well.  In this case, we need to ensure the namespace is created first, otherwise the order will not usually matter.

4. Edit the `hosts` file on the local client to resolve `k8s.myurl.local` (or the modified URL) to an IP address of a `worker` in the cluster, example location for Windows:  
   `C:\Windows\System32\drivers\etc\hosts`

5. Once the URL is resolving successfully, navigate to one of the cluster worker IPs.  Each worker will have an Ingress Controller deployed since it is a daemonset, which will reverse proxy HTTP traffic to the backend.  The web site for the dockerExample image that has been deployed should appear.  

## Deleting the test application and Ingress Controller

1. The Ingress Controller could be kept for future use, it is not apart of the testApp deployment, with the exception of an Ingress Rule created for the app.  However, we'll cleanup the entire environment.
   
1. There are two methods that can be used to delete the deployments:
   1. Delete the deployments with the same files that created them:  
     `docker delete -f ./testApp/`  
     `docker delete -f ./ingress/`

   2. Delete the deployments via the namespace:  
     `kubectl delete namespace testapp`  
     `kubectl delete namespace nginx-ingress`

## Additional Helpful Commands

`kubectl cluster-info`  
`kubectl get nodes`  
`kubectl get pods --namespace testapp -o wide`  
`kubectl get deployments --namespace testapp`  
`kubectl rollout status deployment/mytestapp --namespace testapp`  
`kubectl describe deployment deployment/mytestapp --namespace testapp`  
`kubectl get ingress --namespace testapp`  
`kubectl get services --namespace testapp`  
`kubectl logs deployment/mytestapp --namespace testapp`  
* Gather logs from a pod on the deployment  

`kubectl port-forward --address 0.0.0.0 pod/<podname> 8080:80 --namespace testapp`  
* Via your local client, access https://localhost:8080 and gain access to a pod internal to the cluster