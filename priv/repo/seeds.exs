# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Noot.Repo.insert!(%Noot.SomeModel{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Noot.Repo
alias Noot.Role
alias Noot.User


role =
  case Repo.get_by!(Role, name: "Admin") do
    nil -> %Role{name: "Admin"}
    role -> role
  end
  |> Role.changeset(%{name: "Admin", admin: true})
  |> Repo.insert_or_update!

admin =
  case Repo.get_by!(User, username: "Admin") do
    nil -> %User{username: "Admin"}
    user -> user
  end
  |> User.changeset(%{
    username: "admin",
    email: "admin@test.com",
    password: "password",
    password_confirmation: "password",
    role_id: role.id
    })
  |> Repo.insert_or_update!
