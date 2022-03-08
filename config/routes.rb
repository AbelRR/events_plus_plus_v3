Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # dhh tutorial
  root "components#index"

  # gql tutorial
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql#execute"
  end
  post "/graphql", to: "graphql#execute"
end
