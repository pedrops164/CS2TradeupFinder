#pushes the base image from a remote repository
FROM node:18-alpine

WORKDIR /frontend

#copy the necessary files into the working directory
COPY public/ /frontend/public
COPY src/ /frontend/src
COPY package.json /frontend

# installs all the dependencies specified in the package.json file
RUN npm install

# command used for starting React app
CMD ["npm", "start"]