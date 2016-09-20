defmodule Roles.Repo.Migrations.CreateRol do
  use Ecto.Migration

  def change do
    create table(:roles) do
      add :rolname, :string

      timestamps()
    end

  end
end
