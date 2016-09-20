defmodule Roles.User do
  use Roles.Web, :model

  schema "users" do
    field :username, :string
    field :password, :string, virtual: true
    field :password_hash, :string
    field :owner, :boolean, default: false
    belongs_to :rol, Roles.Rol

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:username, :password, :rol_id])
    |> validate_required([:username, :password, :rol_id])
  end


  def registration_changeset(model, params) do
    model
    |> changeset(params)
    |> cast(params, ~w(password), [])
    |> validate_length(:password, min: 6, max: 100)
    |> put_pass_hash()
  end

  defp put_pass_hash(changeset) do
    case changeset do
      %Ecto.Changeset{valid?: true, changes: %{password: pass}} ->
        put_change(changeset, :password_hash, Comeonin.Bcrypt.hashpwsalt(pass))
      _ ->
        changeset
    end
  end

end








# para el caso de creación de usuarios, saltamos colocar owner en el proceso de cast y validate_required,
# esto porque nos conviene dejar owner en false.
# En el caso de creación de organization, se debe cambiar el estatus a true. En caso de perfq owner está en 
# tabla enlace muchos a muchos para identificar en que organization es owner