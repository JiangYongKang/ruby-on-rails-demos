FROM ruby:2.5.1-slim

# 安装数据库以及编译依赖文件必须的库
RUN apt-get update && apt-get install -y libsqlite3-dev build-essential

RUN mkdir /app
WORKDIR /app

COPY . .

RUN bundle install

CMD ["rails", "s"]
