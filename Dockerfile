FROM alpine:3.9
LABEL maintainer="hajo@ventx.de"

ENV AWSCLI 1.16.140
ENV HELM_VERSION v2.13.1
ENV KUBE_VERSION v1.13.4

RUN apk --update --no-cache add bash ca-certificates curl git gzip jq libc6-compat mongodb mongodb-tools nodejs npm openssh-client python3 util-linux
RUN pip3 install awscli==${AWSCLI}
RUN wget -q https://storage.googleapis.com/kubernetes-release/release/${KUBE_VERSION}/bin/linux/amd64/kubectl -O /usr/local/bin/kubectl \
  && chmod +x /usr/local/bin/kubectl
RUN wget -q http://storage.googleapis.com/kubernetes-helm/helm-${HELM_VERSION}-linux-amd64.tar.gz -O - | tar -xzO linux-amd64/helm > /usr/local/bin/helm \
  && chmod +x /usr/local/bin/helm 

WORKDIR /root

CMD ["/bin/bash"]
