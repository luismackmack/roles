defmodule Roles.Repo.Migrations.RenamePasswordInUser do
  use Ecto.Migration

  def change do
  	rename table(:users), :password, to: :password_hash
  end
end
