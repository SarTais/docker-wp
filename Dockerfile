FROM wordpress:latest

# Common
RUN apt-get update && \
    apt-get install -y \
    sudo \
    zip \
    unzip \
    wget

# Git
RUN apt-get update && \
    apt-get install -y git

# Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer && \
    chmod +x /usr/local/bin/composer && \
    composer self-update

# Node.js
RUN curl -sL https://deb.nodesource.com/setup_14.x -o node_setup.sh && \
    bash node_setup.sh && \
    apt-get install -y nodejs && \
    npm install npm -g

# Yarn
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
    apt-get update && \
    apt-get install -y yarn

# XDebug
RUN pecl install "xdebug" \
    && docker-php-ext-enable xdebug