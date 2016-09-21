defmodule Roles.Observer.DashboardController do
  use Roles.Web, :controller
  plug :access_level, "user"

	def index(conn, _params) do
	  render conn, "index.html"
	end

        # We can do this function plug in module plugs  for let us define a connection transformation in other controllers
  	defp access_level(conn, _opts) do
  		rol_id = conn.assigns.current_user.rol_id
  		current_user_rol = Roles.Repo.get(Roles.Rol, rol_id)
  		cond do
	    	current_user_rol == nil ->
	    		conn
	    		|> put_flash(:error, "You must be logged in to access that page")
	    		|> redirect(to: session_path(conn, :new))

	    	current_user_rol.rolname != "observer" ->
	    		conn
	    		|> put_layout(false)
	    		|> put_status(:not_found)
	    		|> render(Roles.ErrorView, "404.html")
	    		|> halt()

	    	true -> 
	    		conn
	    end
  	end
end
