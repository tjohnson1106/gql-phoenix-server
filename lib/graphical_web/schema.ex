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

     input_object :update_post_params do
        arg :title, non_null(:string)
        arg :body, non_null(:string)
        arg :user_id, non_null(:integer)

         
     end

    end 

    mutation do 
        field :create_post, type: :post do
        arg :title, non_null(:string)
        arg :body, non_null(:string)
        arg :user_id, non_null(:integer)

        resolve &Graphical.PostResolver.create/2
    end 
  end
end