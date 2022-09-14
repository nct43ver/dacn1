FROM node:16.17-alpine as build
ENV NODE_ENV=production

RUN apk update
WORKDIR /app
COPY ["package.json","package-lock.json*","yarn.lock", "./"]
RUN apk add --no-cache git openssh
RUN yarn install
COPY . .

#RUN yarn run build
CMD ["yarn", "dev"]

#FROM httpd:2.4
#COPY --from=build /app /usr/local/apache2/htdocs/
#EXPOSE 443

#FROM fholzer/nginx-brotli:v1.12.2
#WORKDIR /etc/nginx
#ADD nginx.conf /etc/nginx/nginx.conf

#COPY --from=build /app /usr/share/nginx/html
#EXPOSE 443
#CMD ["nginx","-g","daemon off;"]