#compdef kubens kns=kubens
# Source: https://github.com/ahmetb/kubectx/tree/master/completion

_arguments "1: :(- $(kubectl get namespaces -o=jsonpath='{range .items[*].metadata.name}{@}{"\n"}{end}'))"
