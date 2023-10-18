FROM node:20-slim
WORKDIR /app
COPY . /app
RUN npm install
EXPOSE 3000
CMD node index.js

FROM public.ecr.aws/lambda/nodejs:18
COPY index.js ${LAMBDA_TASK_ROOT}
CMD [ "index.handler" ]