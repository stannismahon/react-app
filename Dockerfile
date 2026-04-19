FROM node

WORKDIR /app

RUN apt update && \
    apt install git -y && \
    git clone https://github.com/stannismahon/react-app.git . && \
    npm install

EXPOSE 3000

CMD ["npm", "run", "dev"]