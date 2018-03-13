FROM microsoft/dotnet-framework:4.7.1
WORKDIR /app
COPY ./VBDotNetDockerBuilds/bin/Docker-Release/ .
ENTRYPOINT ["VBDotNetDockerBuilds.exe"]