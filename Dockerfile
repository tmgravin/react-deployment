# Stage 1: Build the React application
FROM node:20-alpine AS build

# Set the working directory
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code
COPY . .

# Build the React application
RUN npm run build

# Stage 2: Serve the application
FROM node:20-alpine

# Set the working directory
WORKDIR /app

# Copy the build output from the build stage
COPY --from=build /app/build /app/build

# Install a simple HTTP server
RUN npm install -g serve

# Expose port 4000
EXPOSE 4000

# Serve the React application
CMD ["serve", "-s", "build", "-l", "4000"]
