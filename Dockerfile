FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
#Copy from 1st 'build' phase above
COPY --from=builder /app/build /usr/share/nginx/html 
