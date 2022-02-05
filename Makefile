test:
	RAILS_ENV=test bundle exec rspec

lint:
	bundle exec rubocop

lint-fix:
	bundle exec rubocop -A

start:
	./bin/dev

console:
	bin/rails console

routes:
	bin/rails routes

reset:
	bin/rails db:drop
	bin/rails db:create
	bin/rails db:migrate
	bin/rails db:seed

sidekiq:
	bundle exec sidekiq

seed:
	bin/rails db:seed:replant
