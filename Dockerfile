FROM ubuntu:18.04

RUN apt-get update

RUN apt-get install -y autoconf bison build-essential libssl-dev libyaml-dev libreadline6-dev \
  zlib1g-dev libncurses5-dev libffi-dev libgdbm5 libgdbm-dev libdb-dev vim

RUN apt-get -y install libssl1.0-dev

RUN apt-get install -y git curl

RUN cd ~/ && \
  git clone https://github.com/sstephenson/rbenv.git ~/.rbenv

ENV PATH /root/.rbenv/shims:/root/.rbenv/bin:/usr/local/sbin::$PATH
ENV APP_PATH /app
RUN mkdir $APP_PATH

RUN cd ~/ && \
  git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build && \
  rbenv install -l && \
  rbenv install 3.0.3 && \
  rbenv global 3.0.3 && \
  rbenv versions

ADD Gemfile $APP_PATH/Gemfile
ADD Gemfile.lock $APP_PATH/Gemfile.lock
RUN cd $APP_PATH && bundle install
COPY . $APP_PATH

WORKDIR $APP_PATH

CMD ["/bin/bash"]