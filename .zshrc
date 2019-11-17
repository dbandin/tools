# Deployer folder name check
if [ "$ENV" = "prod" ]; then 
  export DEPLOYER_FOLDER='trace_donate';
else
  export DEPLOYER_FOLDER='test_deployments';
fi

export PATH=/usr/local/bin:$PATH
alias k='kubectl'
alias kg='kubectl get'
alias kd='kubectl describe'
alias ka='kubectl apply'
alias kc='kubectl config'
alias kl='kubectl logs'
alias python='python3.7'
source ~/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions

# Load the theme.
antigen theme denysdovhan/spaceship-prompt

# Tell Antigen that you're done.
antigen apply
 
# Kubectl autocompletion
k completion zsh > kubectl-completion.sh
. ./kubectl-completion.sh
rm ./kubectl-completion.sh