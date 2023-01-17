FROM alpine:3.11

ARG KUBECTL_VERSION="1.22"

RUN apk add py-pip curl
RUN pip install awscli
RUN curl -L -o /usr/bin/aws-iam-authenticator https://github.com/kubernetes-sigs/aws-iam-authenticator/releases/download/v0.5.9/aws-iam-authenticator_0.5.9_linux_amd64
RUN chmod +x /usr/bin/aws-iam-authenticator
RUN curl -L -o /usr/bin/kubectl https://s3.us-west-2.amazonaws.com/amazon-eks/1.22.15/2022-10-31/bin/linux/amd64/kubectl
RUN chmod +x /usr/bin/kubectl
ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
