defmodule Roles.RolTest do
  use Roles.ModelCase

  alias Roles.Rol

  @valid_attrs %{rolname: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Rol.changeset(%Rol{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Rol.changeset(%Rol{}, @invalid_attrs)
    refute changeset.valid?
  end
end
