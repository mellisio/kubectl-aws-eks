FROM amazon/aws-cli:2.5.0

RUN yum clean all && yum install jq -y && curl -sL -o /usr/bin/kubectl https://storage.googleapis.com/kubernetes-release/release/v1.22.6/bin/linux/amd64/kubectl && \
    curl -sL -o /usr/bin/aws-iam-authenticator https://github.com/kubernetes-sigs/aws-iam-authenticator/releases/download/v0.5.3/aws-iam-authenticator_0.5.3_linux_amd64  && \
    chmod +x /usr/bin/aws-iam-authenticator && \
    chmod +x /usr/bin/kubectl

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
