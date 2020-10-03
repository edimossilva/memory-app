# install

1. build containers

   `docker-compose build`

1. start containers in background

   `docker-compose up -d`

1. config db

   `docker-compose exec memory_app_back rake db:create`

   `docker-compose exec memory_app_back rake db:migrate`

1. tests

   `docker-compose exec memory_app_back rspec`

1. access

   `http://localhost:3333`

1. Semaphore (parallel tests / lint)

    [![Build Status](https://edimossilva.semaphoreci.com/badges/memory-app-rails/branches/master.svg?style=shields)](https://edimossilva.semaphoreci.com/projects/memory-app-rails)

1. Code-climate - Test Coverage

   [![Test Coverage](https://api.codeclimate.com/v1/badges/717f9f8d644f0fcfe2c2/test_coverage)](https://codeclimate.com/github/edimossilva/memory-app-rails/test_coverage)

1. Code-climate - Maintainability

   [![Maintainability](https://api.codeclimate.com/v1/badges/717f9f8d644f0fcfe2c2/maintainability)](https://codeclimate.com/github/edimossilva/memory-app-rails/maintainability)
