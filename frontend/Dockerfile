# Use an official Node runtime as a parent image
FROM node:18-alpine

# Set the working directory
WORKDIR /usr/src/frontend

# Copy package.json
COPY package-lock.json /usr/src/frontend/package-lock.json
COPY package.json /usr/src/frontend/package.json
COPY public/ /usr/src/frontend/public
COPY src/ /usr/src/frontend/src

# Install dependencies
RUN npm install

RUN apk --no-cache add curl

# Expose the application port
EXPOSE 3000

# Start the application
CMD ["npm", "run", "dev"]
