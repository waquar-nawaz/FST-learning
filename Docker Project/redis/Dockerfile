#Specify base image
FROM alpine

#create a working directory
WORKDIR /usr/app

#Instal redis in Alpine
RUN apk add --update redis

#Start the redis server
CMD ["redis-server"]
