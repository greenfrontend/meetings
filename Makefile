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

seed:
	bin/rails db:seed:replant
