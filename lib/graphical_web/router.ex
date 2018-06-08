defmodule GraphicalWeb.Router do
  use GraphicalWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", GraphicalWeb do
    pipe_through :api
    resources "/users", UserController, except: [:new, :edit]
    resources "/posts", PostController, except: [:new, :edit]
  end

  forward "/api", Absinthe.Plug,
    schema: GraphicalWeb.Schema
  
  forward "/graphiql", Absinthe.Plug.GraphiQL,
    schema: GraphicalWeb.Schema
  end
