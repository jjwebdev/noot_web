defmodule Noot.Factory do
  # with Ecto
  use ExMachina.Ecto, repo: Noot.Repo

  def user_factory do
    %Noot.User{
      username: "janesmith",
      email: sequence(:email, &"email-#{&1}@example.com"),
    }
  end
end
