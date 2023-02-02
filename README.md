# kubectl in github actions

Github actions for automating kubectl commands. It has support for EKS cluster where kubeconfig is generated through [aws-iam-authenticate](https://github.com/kubernetes-sigs/aws-iam-authenticator) 

## Examples:

```yml

name: Push

on:
  - push
      branches:
      - master
jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout
        uses: actions/checkout@v2
      - name: Create/Modify deployment
        uses: gane5hvarma/kubectl-actions@master
        env:
          KUBE_CONFIG_DATA: ${{ secrets.KUBE_CONFIG_DATA }}
        with:
          args: apply -f deployment.yaml

```
> KUBE_CONFIG_DATA should be base64 encoded before saving in secrets


If multiple kubectl commands need to be executed ,use v2 as 

on:
  push:
name: Check args
jobs:
  deploy:
    name: Checking Args
    runs-on: ubuntu-latest
    steps:
      - name: EKS Deploy
        id: deploy-image
        uses: Samsung360VR/kubectl-actions@v2             #{owner}/{repo}@sha
        env:
          KUBE_CONFIG_DATA: ${{ secrets.UG_KUBE_CONFIG_DATA }}
        with:
          args: "['get pods -n gaming-dev' , 'get pods -n gaming-dev' , 'get pods -n gaming-dev']"
