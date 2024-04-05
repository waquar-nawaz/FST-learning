#Specify base image
FROM node:18-alpine

#Create Working directory
WORKDIR /usr/app

#copy the package.json into the container
COPY package.json ./

#Install dependencies
RUN npm install

#Copy all other file into the container
COPY ./ ./


#Start the server
CMD ["npm","start"]
