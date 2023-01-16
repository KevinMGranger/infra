set -l unknown_ctx "🤷"
set -l not_installed "❔"

if which current-kube-context >/dev/null 2>&1
    set kube_ctx (current-kube-context 2>/dev/null) || set kube_ctx $unknown_ctx
else
    set kube_ctx $not_installed
end

set -a prompt_parts "☸️ $kube_ctx"