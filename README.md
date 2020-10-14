# Read Me

1. start containers in background (only use images)

   `docker-compose up -d`

1. config db

   `docker-compose exec memory_app_back rake db:create rake db:migrate`

1. tests

   `docker-compose exec memory_app_back rspec`

1. access

   `http://localhost:3000`

1. Semaphore (parallel tests / lint)

   [![Build Status](https://edimossilva.semaphoreci.com/badges/memory-app-rails/branches/master.svg?style=shields)](https://edimossilva.semaphoreci.com/projects/memory-app-rails)

1. Code-climate - Test Coverage

   [![Test Coverage](https://api.codeclimate.com/v1/badges/717f9f8d644f0fcfe2c2/test_coverage)](https://codeclimate.com/github/edimossilva/memory-app-rails/test_coverage)

1. Code-climate - Maintainability

   [![Maintainability](https://api.codeclimate.com/v1/badges/717f9f8d644f0fcfe2c2/maintainability)](https://codeclimate.com/github/edimossilva/memory-app-rails/maintainability)

1. Heroku

   https://memory-app-back.herokuapp.com/

1. Swagger

   https://memory-app-back.herokuapp.com/api-docs/index.html

1. Docker image

   https://hub.docker.com/repository/docker/edimossilva/memory_app_rails
