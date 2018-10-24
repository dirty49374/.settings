
# kubernetes

alias k="kubectl"
alias kg="kubectl get"
alias kgp="kubectl get pod"
alias kgs="kubectl get svc"
alias kgn="kubectl get nodes"
alias kgpa="kubectl get pods --all-namespaces"
alias kp="kubectl proxy"
alias kpall="kubectl proxy --address='0.0.0.0' --accept-hosts='.*'"
alias kd="kubectl describe"
alias kdp="kubectl describe pod"
alias kds="kubectl describe svc"
alias kaf="kubectl apply -f"
alias kdelf="kubectl delete -f"
alias kgc="kubectl config get-contexts"
alias kuc="kubectl config use-context"

alias klog-alb="kubectl logs -n kube-system $(kubectl get po -n kube-system | egrep -o 'alb-ingress[a-zA-Z0-9-]+')"
alias klog-edns="kubectl logs $(kubectl get po | egrep -o 'external-dns-[a-zA-Z0-9-]+')"

# bashrc
alias sour="source ~/.bashrc"

export PATH="$PATH:~/bin:~/.settings/bin:~/.local/bin"

