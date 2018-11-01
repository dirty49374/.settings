#!/bin/bash

export PATH="$PATH:~/bin:~/.settings/bin:~/.local/bin"

# kubernetes

alias k="kubectl"

alias kg="kubectl get"
alias kgp="kubectl get pod"
alias kgs="kubectl get svc"
alias kgn="kubectl get nodes"
alias kgpa="kubectl get pods --all-namespaces"

alias kd="kubectl describe"
alias kdp="kubectl describe pod"
alias kds="kubectl describe svc"
alias kdn="kubectl describe nodes"

alias kp="kubectl proxy"
alias kpall="kubectl proxy --address='0.0.0.0' --accept-hosts='.*'"

alias kaf="kubectl apply -f"
alias kaff="kubectl apply -f - <<EOF"
alias kdelf="kubectl delete -f"

alias kgc="kubectl config get-contexts"
alias kuc="kubectl config use-context"
 
alias klog-alb='kubectl logs -n kube-system $(kubectl get po -n kube-system | egrep -o 'alb-ingress[a-zA-Z0-9-]+')'
alias klog-edns='kubectl logs $(kubectl get po | egrep -o 'external-dns-[a-zA-Z0-9-]+')'


alias kc=kubectx
alias kn=kubens

# bashrc
alias sour="source ~/.bashrc"


. ~/.settings/kube-ps1.sh

# kube-ps1 prompt

PS1='[\u@\h \W $(kube_ps1)]\$ '

docker-tags() {
    arr=("$@")

    for item in "${arr[@]}";
    do
        tokenUri="https://auth.docker.io/token"
        data=("service=registry.docker.io" "scope=repository:$item:pull")
        token="$(curl --silent --get --data-urlencode ${data[0]} --data-urlencode ${data[1]} $tokenUri | jq --raw-output '.token')"
        listUri="https://registry-1.docker.io/v2/$item/tags/list"
        authz="Authorization: Bearer $token"
        result="$(curl --silent --get -H "Accept: application/json" -H "Authorization: Bearer $token" $listUri | jq --raw-output '.')"
        echo $result
    done
}

