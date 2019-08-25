Rails.application.routes.draw do
  root to: "console#index"

  namespace :public_api do
    post "/graphql", to: "graphql#execute"
  end

  namespace :internal_api do
    post "/graphql", to: "graphql#execute"
  end

  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/public_api/graphiql",   graphql_path: "/public_api/graphql", as: :public_graphiql_rails
    mount GraphiQL::Rails::Engine, at: "/internal_api/graphiql", graphql_path: "/internal_api/graphql", as: :internal_graphiql_rails
  end
end
