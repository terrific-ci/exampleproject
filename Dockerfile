# Use Node.js LTS version as the base image
FROM oven/bun:1.2

# Set working directory
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN bun install

# Copy the rest of the application code
COPY . .

# Build the TypeScript application
RUN bun build --compile src/index.ts --outfile=app

# Expose the port the app will run on
EXPOSE 4999

CMD ["/app/app"]