defmodule Roles.Rol do
  use Roles.Web, :model

  schema "roles" do
    field :rolname, :string
    has_many :users, Roles.User, on_delete: :delete_all

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:rolname])
    |> validate_required([:rolname])
  end
end
