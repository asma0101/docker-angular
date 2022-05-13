From node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build --prod


FROM nginx

#copy /app/build folder from builder stage into /usr/share/nginx/html
EXPOSE 80
COPY --from=builder /app/dist/angular-app /usr/share/nginx/html