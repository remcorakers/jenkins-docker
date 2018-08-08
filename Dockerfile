FROM jenkins/jenkins:2.134

USER root

# Install Azure CLI and Maven
RUN apt-get update && apt-get install -y lsb-release
RUN AZ_REPO=$(lsb_release -cs) && \
  echo "deb [arch=amd64] https://packages.microsoft.com/repos/azure-cli/ $AZ_REPO main" | \
  tee /etc/apt/sources.list.d/azure-cli.list
RUN curl -L https://packages.microsoft.com/keys/microsoft.asc | apt-key add -
RUN apt-get install apt-transport-https
RUN apt-get update && apt-get install -y \
  azure-cli \
  maven
