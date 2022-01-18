test:
	bundle exec rspec

lint:
	bundle exec rubocop

lint-fix:
	bundle exec rubocop -A

start:
	bin/rails server
