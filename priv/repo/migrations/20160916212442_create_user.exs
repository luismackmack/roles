defmodule Roles.Repo.Migrations.CreateUser do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :username, :string
      add :password, :string
      add :owner, :boolean, default: false, null: false
      add :rol_id, references(:roles, on_delete: :nothing)

      timestamps()
    end
    create index(:users, [:rol_id])

  end
end
