Param(
    [Parameter(Mandatory=$false)]
    [string]$action,
    [Parameter(Mandatory=$false)]
    [string]$name
    )

function usage() {
    Write-Output "
        Usage 
          kubenswin                        : current namespace
          kubenswin ls                     : list the namespaces in the current context
          kubenswin set <name>             : switch to another namespace in the current context
          kubenswin help                   : display usage"
  }

function current_context() {
    kubectl config view -o=jsonpath='{.current-context}'
}

function print_current_namespace() {
    $cur = (current_context)
    $nsp = kubectl config view -o=jsonpath="{.contexts[?(@.name=='$cur')].context.namespace}"

    if (!$nsp) {
        Write-Host 'default'
    }else{
        Write-Host $nsp
    }

}

function set_namespace() {
    $cur = (current_context)
    kubectl config set-context $cur --namespace=$name
    Write-Host "Active namespace is $name in context $cur"
}

function current_namespace() {
    $cur = (current_context)
    $nsp = kubectl config view -o=jsonpath="{.contexts[?(@.name=='$cur')].context.namespace}"

    if (!$nsp) {
        return 'default'
    }else{
        return $nsp
    }
}

function list_namespaces() {
    $cur = (current_namespace)
    $gnsp = (get_namespaces)

    ForEach ($i in $gnsp) {
        if ($i -eq $cur) {
            Write-Host "*" $i -ForegroundColor Red
        } else {
            Write-Host $i
        }
        }
    }

function get_namespaces() {
    kubectl get namespaces -o=jsonpath='{range .items[*].metadata.name}{@}{''\n''}{end}'
}

function main() {
    switch ($action) {
        Default {print_current_namespace}
        ls {list_namespaces}
        set {set_namespace}
        help {usage}
    }
}

main