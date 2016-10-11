defmodule Noot.PageControllerTest do
  use Noot.ConnCase

  test "GET /", %{conn: conn} do
    conn = get conn, "/"
    assert html_response(conn, 200) =~ "Hello Noot!"
  end
end
