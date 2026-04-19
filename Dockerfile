FROM node as builder

WORKDIR /app

RUN apt update && \
    apt install git -y && \
    git clone https://github.com/stannismahon/react-app.git . && \
    npm install && \
    npm run build

FROM nginx:alpine as production

ENV NODE_ENV=production

COPY --from=builder /app/dist /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]