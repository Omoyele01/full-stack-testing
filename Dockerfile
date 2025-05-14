# Use Node.js image
FROM node:18-alpine

# Set app directory inside container
WORKDIR /app

# Copy dependencies
COPY package*.json ./

# Install only production dependencies
RUN npm install

# Copy all files
COPY . .

# Build the React app
RUN npm run build

# Expose the app port
EXPOSE 8081

# Start the server
CMD ["node", "src/server/index.js"]
