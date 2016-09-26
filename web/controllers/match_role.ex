defmodule Roles.MatchRole do
	use Roles.Web, :controller

	def match_role(conn) do #Dynamically Calling Functions in Elixir
		phoenix_controller = Atom.to_string(conn.private.phoenix_controller) |> String.split(".") |> Enum.at(2)  |> String.to_atom
		# "Elixir.Roles.DashboardController" |> ["Elixir", "Roles", "DashboardController"] |> "DashboardController" |> :DashboardController
		phoenix_action = conn.private.phoenix_action	#:index

		case conn.assigns.current_user do
		 	nil ->
				nil
		 	_	->
		 		current_user_role = Roles.Repo.get(Roles.Rol, conn.assigns.current_user.rol_id)
		 		controller = cond do	
		 			current_user_role.rolname == "manager" ->
		 				%{module: Module.concat(Roles, Manager) |> Module.concat(phoenix_controller), action: phoenix_action}
		 			current_user_role.rolname == "member" ->
						%{module: Module.concat(Roles, Member) |> Module.concat(phoenix_controller), action: phoenix_action}
		 			current_user_role.rolname == "observer" ->
		 				%{module: Module.concat(Roles, Observer) |> Module.concat(phoenix_controller), action: phoenix_action}
		 			true ->
		 				nil
		 		end
		end
	end
end