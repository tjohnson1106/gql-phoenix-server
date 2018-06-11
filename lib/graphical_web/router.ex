defmodule GraphicalWeb.Router do
  use GraphicalWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :graphql do
    plug GraphicalWeb.Context 
  end

  scope "/", GraphicalWeb do
    pipe_through :api
    resources "/users", UserController, except: [:new, :edit]
    resources "/posts", PostController, except: [:new, :edit]
  end

  scope "/api" do
    pipe_through :graphql
    
    forward "/", Absinthe.Plug,
    schema: GraphicalWeb.Schema
    end


  
  forward "/graphiql", Absinthe.Plug.GraphiQL,
    schema: GraphicalWeb.Schema
  end
