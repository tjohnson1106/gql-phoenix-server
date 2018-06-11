defmodule Graphical.Repo.Migrations.AddTokenToUsers do
  use Ecto.Migration

  def change do
    #post add_token_to_users migration
    alter table(:users) do
      add :token, :string
    end

  end
end
