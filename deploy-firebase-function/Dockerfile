FROM node:20-slim
RUN npm install -g firebase-tools firebase-functions
COPY entrypoint.sh /usr/local/bin
ENTRYPOINT ["entrypoint.sh"]
