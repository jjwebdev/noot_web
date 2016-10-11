defmodule Noot.SessionController do
  use Noot.Web, :controller
  alias Noot.User
  def new(conn, _params) do
    render conn, "new.html"
  end
end
