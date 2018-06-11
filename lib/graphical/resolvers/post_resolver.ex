defmodule Graphical.PostResolver do
    alias Graphical.Posts

    def all(_args, _info) do
        {:ok, Posts.list_posts()}
    end

    def create(args, _info) do
        Posts.create_post(args)
    end

    def update(%{id: id, post: post_params}, _info) do
        Posts.get_post!(id)
        |> Posts.update_post(post_params)
    end

end