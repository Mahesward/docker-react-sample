
# !Specifying The image 
FROM node:16.20.0-alpine3.18

# !Adding the project directory

WORKDIR /app

# !copying the package.json file 
COPY  package*.json .
RUN npm install

# !copying the project files to docker 
COPY . .

ENV VITE_APP_BACKEND_API = http://localhost:4000/api/v1/
EXPOSE 3000

# !adding new usergroup 
RUN addgroup app && adduser -S -G app app
USER app

# !adding start comand
CMD ["npm","run","dev"]