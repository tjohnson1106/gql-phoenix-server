defmodule GraphicalWeb.Schema do
    use Absinthe.Schema
    import_types GraphicalWeb.Schema.Types
    
    #defining end user queries
    query do
        field :posts, list_of(:post) do
            resolve &Graphical.PostResolver.all/2
        end

    field :users, list_of(:user) do
        resolve &Graphical.UserResolver.all/2

      end
   
      field :user, type: :user do
          arg :id, non_null(:id)
          resolve &Graphical.UserResolver.find/2
      end 
    end 
end