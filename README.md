# terraform-eks


A full EKS cluster based on [eks-getting-started](https://www.terraform.io/docs/providers/aws/guides/eks-getting-started.html). This setup make use of a .tfvars file to customise the cluster capacity scaling the number of availability zones, size and number of workers nodes.


e.g demo.tfvars

```
cluster_name = "demo"

region = "eu-west-1"

instance_type = "t3.micro"

desired_capacity = 2

max_size = 3

min_size = 1

az_count = "2"

cidr_block = "10.0.0.0/16"

owners = "602401143452" # 602401143452 is AWS or self

```  

**What is Kubernetes?**

According to the official [website](https://kubernetes.io/docs/concepts/overview/what-is-kubernetes/):

_Kubernetes is a portable, extensible open-source platform for managing containerized workloads and services, that facilitates both declarative configuration and automation. It has a large, rapidly growing ecosystem. Kubernetes services, support, and tools are widely available._


## Features



## Installation

**Requirements**

OS X & Linux:

- [Terraform](https://www.terraform.io/)
- [aws-iam-authenticator](https://github.com/kubernetes-sigs/aws-iam-authenticator)

Use go get to install the aws-iam-authenticator binary.

` go get -u -v github.com/kubernetes-sigs/aws-iam-authenticator/cmd/aws-iam-authenticator`

**Setup**

```sh
git clone git@github.com:p0bailey/terraform-eks.git
```


## Usage example

**Quickstart:**

1) `mkdir .kube`

2) `export KUBECONFIG=.kube/eksconfig`

3) `terraform init -var-file="demo.tfvars"`

4) `terraform plan -var-file="demo.tfvars"`

5) `terraform apply -var-file="demo.tfvars"`

6) `terraform output kubeconfig > .kube/eksconfig`


```
NAME                 STATUS    MESSAGE              ERROR
controller-manager   Healthy   ok
scheduler            Healthy   ok
etcd-0               Healthy   {"health": "true"}
```

Add workers nodes into the cluster.

8) `terraform output config_map_aws_auth > config_map_aws_auth.yml`

9) `kubectl apply -f  config_map_aws_auth.yml`

```
configmap/aws-auth created
```

10) `kubectl get nodes`

Then you must see the nodes in Ready status.

```
ip-10-0-0-244.us-west-2.compute.internal   Ready    <none>   54s   v1.10.3
ip-10-0-1-53.us-west-2.compute.internal    Ready    <none>   53s   v1.10.3
```



## Release History

* 0.0.1
    * First release, basic cluster.

## Meta

Phillip Bailey– [@p0bailey](https://twitter.com/@p0bailey) – phillip.bailey@stack42.io

Distributed under the MIT license. See ``LICENSE`` for more information.

[https://github.com/p0bailey/kubernetes-the-awesome-way](https://github.com/p0bailey/terraform-eks)

## Contributing

1. Fork it (<https://github.com/p0bailey/terraform-eks>)
2. Create your feature branch (`git checkout -b feature/fooBar`)
3. Commit your changes (`git commit -am 'Add some fooBar'`)
4. Push to the branch (`git push origin feature/fooBar`)
5. Create a new Pull Request
