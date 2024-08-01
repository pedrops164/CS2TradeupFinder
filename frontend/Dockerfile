# Use an official Node runtime as a parent image
FROM node:18-alpine

# Set the working directory
WORKDIR /usr/src/frontend

# Copy package.json
COPY package.json /usr/src/frontend/package.json

# Install dependencies
RUN npm install

# Copy the rest of the application
COPY . /usr/src/frontend

RUN apk --no-cache add curl

# Expose the application port
EXPOSE 3000

# Start the application
CMD ["npm", "run", "dev"]
