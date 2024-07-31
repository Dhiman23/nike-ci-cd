
# :pisces: ReactJS Nike Ecommerce Clone

This project is a ReactJS-based clone of the Nike ecommerce website. It aims to replicate the core functionality and design of the original site, providing users with a familiar experience.
![nike-clone](https://github.com/mohsin-786/nike-clone-ingress/assets/109455638/e2b8e06d-7318-4559-8904-ff6235b4bf38)



# :placard: Diagram
![ingress](https://github.com/mohsin-786/nike-clone-ingress/assets/109455638/40a14851-6bd7-4a9a-a507-d11baee573fe)



# :inbox_tray: Installation

To run in local machine using Minikube

Install Minikube Kubectl and Docker

For Arch-Based:

-  Use an AUR helper like yay or paru

```bash
yay -Syu minikube kubectl docker
```
- Secondly
```bash
  sudo systemctl start docker
  sudo usermod -aG docker $USER
```    
- Lastly
```bash
  minikube start --kubernetes-version=latest
```

 For other distributions, you can install Docker and Kubectl using your package manager.
 
 And for Minikube do the following:


```bash
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube
minikube start --kubernetes-version=latest

```

# :twisted_rightwards_arrows: Ingress

Enable ingress for DNS:

```bash
 minikube addons enable ingress 
 minikube addons enable ingress-dns
```




# :satellite: Deployment

To deploy your ReactJS application with Docker and Kubernetes, you can follow these steps:

Firstly:

```bash
 git clone  https://github.com/mohsin-786/nike-clone-ingress.git
```

Secondly:
```bash
  cd nike-clone-ingress; cd k8s
```

Thirdly:
```bash
  kubectl apply -f <file-name>
```

# :label: Using Host described in Ingress Manifest File:

After the Deployment is complete do the following:
```bash
  kubectl get ingress
```

And from the output of the above command
Note the HOSTS and ADDRESS fields

And then edit the hosts file:
```bash
  sudo vi /etc/hosts
```
And then add the ADDRESS and HOSTS from the above command as in this example:

<address> <host>
127.0.0.1 localhost

# :man_technologist: Author

- [@SiddharthThapa](https://github.com/SMThapa)




