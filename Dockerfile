FROM python:3.8-slim-bullseye

RUN apt-get update
RUN apt-get install -y zip unzip git bash make curl openssl openssh-client

ENV TERRAFORM_VERSION="1.3.7"

RUN curl https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip > terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
  unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip -d /bin && \
  rm -f terraform_${TERRAFORM_VERSION}_linux_amd64.zip

RUN pip install awscli boto3

ENTRYPOINT ["bin/bash"]
