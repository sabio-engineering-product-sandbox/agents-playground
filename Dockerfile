FROM node:20

ENV APP_HOME=/app
RUN mkdir ${APP_HOME}
WORKDIR ${APP_HOME}

ENV PATH=${APP_HOME}/node_modules/.bin:${PATH}

COPY ./package.json ./package-lock.json ${APP_HOME}/
RUN npm i

COPY . ${APP_HOME}
RUN npm run build

EXPOSE 3000

CMD ["/app/entrypoint.sh"]
