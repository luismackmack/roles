defmodule Roles.SessionController do
  use Roles.Web, :controller

  def new(conn, _) do
    render conn, "new.html"
  end

  def create(conn, %{"session" => %{"username" => user, "password" => pass}}) do #  Parametros que vienen del frontend, formulario de logueo
    case Roles.Auth.login_by_username_and_pass(conn, user, pass, repo: Repo) do
      {:ok, conn} ->
        case conn.assigns.current_user.rol.rolname do
          "manager" ->
            redirect(conn, to: manager_dashboard_path(conn, :index))
          "member" ->
            redirect(conn, to: member_dashboard_path(conn, :index))
          "observer" ->
            redirect(conn, to: observer_dashboard_path(conn, :index))
        end

      {:error, _reason, conn} ->
        conn
        |> put_flash(:error, "Invalid username/password combination")
        |> render("new.html")
    end
  end

  def delete(conn, _) do
    conn
    |> Roles.Auth.logout()
    |> redirect(to: page_path(conn, :index))
  end
end