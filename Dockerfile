# Use the official Ruby image as a base
FROM ruby:3.2.2

# Set environment variables
ENV LANG=C.UTF-8 \
    TZ=UTC

# Install dependencies
RUN apt-get update -qq && \
    apt-get install -y --no-install-recommends \
    build-essential \
    nodejs \
    libpq-dev \
    sqlite3 \
    && rm -rf /var/lib/apt/lists/*

# Set up a directory for the Rails app
RUN mkdir -p /app
WORKDIR /app

# Copy the Gemfile and Gemfile.lock into the container
COPY Gemfile Gemfile.lock ./

# Install gem dependencies
RUN bundle install

# Copy the rest of the application code into the container
COPY . .

# Expose port 3000 to the Docker host
EXPOSE 3000

# Start the Rails server
CMD ["rails", "server", "-b", "0.0.0.0"]