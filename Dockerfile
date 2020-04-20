# golang image where workspace (GOPATH) configured at /go.
FROM golang:latest

#RUN gcr.io/cloudsql-docker/gce-proxy
#RUN go build /go/src/cloud_sql_proxy

# install mysql client
RUN apt-get update && apt-get install -y default-mysql-client

# install mysql driver
RUN go get github.com/go-sql-driver/mysql
RUN go install /go/src/github.com/go-sql-driver/mysql


# copy the local package files to the container's workspace.
ADD . /go/src/github.com/GoogleCloudPlatform/cloudsql-proxy/proxy/dialers/mysql
RUN go install github.com/GoogleCloudPlatform/cloudsql-proxy/proxy/dialers/mysql





# copy the local package files to the container's workspace.
ADD . /go/src/github.com/darrenmcilroy/golang-docker
RUN go install github.com/darrenmcilroy/golang-docker


ENTRYPOINT /go/bin/golang-docker
EXPOSE 8080