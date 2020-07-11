from python:3.7

WORKDIR /root

LABEL maintainer="Diego Leonardo Bandin <dbandin@gmail.com>"
LABEL source="https://github.com/dbandin/tools"
ARG commit
LABEL commit="$commit"

# Tools
## Kubernetes cli kubectl
ARG KUBECTL_VERSION="v1.14.0"
RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/${KUBECTL_VERSION}/bin/linux/amd64/kubectl && chmod +x ./kubectl && mv ./kubectl /usr/local/bin/kubectl

## Helm
ARG HELM_VERSION="v2.14.1"
RUN curl -LO https://git.io/get_helm.sh && chmod +x get_helm.sh && ./get_helm.sh --version $HELM_VERSION && helm init -c

## Terraform
ARG TERRAFORM_VERSION="0.11.13"
RUN apt-get install unzip && wget https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip
RUN unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip && mv terraform /usr/local/bin/ && rm terraform_${TERRAFORM_VERSION}_linux_amd64.zip

## Python requirements
COPY python-requirements.txt /root/
RUN pip install --upgrade pip && \
    pip install --no-cache-dir -r python-requirements.txt

## Docker
RUN curl -fsSL https://get.docker.com -o get-docker.sh && sh get-docker.sh && rm get-docker.sh

## Final config
RUN apt install -y zsh vim tmux
COPY .zshrc antigen.zsh /root/
CMD /bin/zsh
