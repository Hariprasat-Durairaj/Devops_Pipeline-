# Use the official Node.js image with Alpine Linux as the base image
FROM node:19.7.0-alpine

# Set environment variable
ENV NODE_ENV=production

# Create a new directory called labone
RUN mkdir /labone

# Change ownership to node user and group
RUN chown -R node:node /labone

# Set the working directory to /labone
WORKDIR /labone

# Set the user to node
USER node

# Copy all source files and change ownership
COPY --chown=node:node . .

# Run npm install to install Node.js packages
RUN npm install

# Expose port 8080
EXPOSE 8080

# Set the default execution command
CMD ["node", "src/index.js"]
