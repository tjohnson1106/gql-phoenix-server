defmodule Graphical.PostResolver do
    alias Graphical.Posts

    def all(_args, _info) do
        {:ok, Posts.list_posts()}
    end

    def create(args, _info) do
        Posts.create_post(args)
    end
end