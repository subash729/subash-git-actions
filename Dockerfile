# Downloading even stable version

FROM node:20-alpine

# Set the working directory
WORKDIR /backend
RUN apk --no-cache add yarn


# Copy package.json and package-lock.json
COPY package*.json /backend/
COPY yarn.lock /backend/


# Install dependencies
RUN yarn install

# Copy the rest of the application
COPY . .

# Expose the backend port
EXPOSE 3000

ENV DB_HOST=your-db-host
ENV DB_USER=your-db-user
ENV DB_PASSWORD=your-db-password
ENV DB_NAME=your-db-name

# Command to run the backend
CMD yarn migrate; \
	yarn start