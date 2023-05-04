# # Use the official Node.js image as a parent image
# FROM node:12.16.2-alpine

# # Set the working directory to /app
# WORKDIR /app

# # Copy the package.json and package-lock.json files to the working directory
# COPY package*.json ./

# # Install the application dependencies
# RUN npm install --production

# # Copy the application source code to the working directory
# COPY . .

# # Expose port 3000
# EXPOSE 3000

# # Start the application
# CMD [ "npm", "start" ]

# Use the official Node.js image as a parent image
FROM node:12.16.2-alpine

# Install MongoDB client
RUN apk add --no-cache mongodb-tools

# Set the working directory to /app
WORKDIR /app

# Copy the package.json and package-lock.json files to the working directory
COPY package*.json ./

# Install the application dependencies
RUN npm install --production

# Copy the application source code to the working directory
COPY . .

# Expose port 3000
EXPOSE 3000

# Start MongoDB and the application
CMD npm run mongo:start && sleep 5 && npm start
