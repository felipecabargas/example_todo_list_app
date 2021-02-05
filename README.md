**Rails**

```bash
rails new example_app
rails db:create
rails generate scaffold List name:string
rails generate scaffold Task body:string completed:boolean list:references
rails db:migrate
```

Inside `Gemfile` add 

```ruby
gem "pry-rails"
```

Then run

```
bundle install
```

Go to `config/routes.rb` and add

```ruby
resources :lists do
  resources :tasks
end

root to: "lists#index"
```

Replace all `task_path` for `list_task_path `

Replace all edit paths from `(@task)` to `(@task.list, @task)`

Inside `tasks_controller.rb` add the following `private` method (and set it as a `before_action`)

```
def set_list
  @list = List.find(params[:list_id])
end
```

Pass `@list` as a param to `Task.new` in the `new` action inside `TasksController`
