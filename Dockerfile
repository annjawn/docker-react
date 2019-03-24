#Production build

# Phase 1 top build the react app using alpine linux
# uses the alias "as builder"
FROM node:alpine as builder 
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# Phase 2 run the app using a NGINX container
# the path is from NGINX Docker hub documentation
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
