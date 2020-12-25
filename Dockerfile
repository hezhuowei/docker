FROM ubuntu
ENV NODE_ENV production
RUN mkdir -p /app
WORKDIR /app
CMD npm start

RUN sed -i s@/archive.ubuntu.com/@/mirrors.ustc.edu.cn/@g /etc/apt/sources.list
RUN apt clean
RUN apt update
# RUN apt upgrade -y
# RUN export DEBIAN_FRONTEND=noninteractive
ENV DEBIAN_FRONTEND noninteractive
RUN apt install -y tzdata
RUN apt install -y curl  
RUN apt install -y xfonts-utils
RUN apt install -y libreoffice
RUN apt install -y pdftk
RUN curl -sL https://deb.nodesource.com/setup_14.x | bash -
RUN curl -sL https://deb.nodesource.com/setup_14.x | bash -
RUN apt install -y nodejs
RUN npm config set registry https://registry.npm.taobao.org
RUN npm install yarn -g
RUN yarn config set registry https://registry.npm.taobao.org
RUN yarn global add lerna typescript
