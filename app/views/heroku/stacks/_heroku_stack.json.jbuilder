json.extract! heroku_stack, :id, :name, :heroku_identifier, :heroku_name, :created_at, :updated_at
json.url heroku_stack_url(heroku_stack, format: :json)
