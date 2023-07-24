defmodule RangerWeb.TodoLiveTest do
  @moduledoc false

  use RangerWeb.ConnCase

  import Phoenix.LiveViewTest

  test "user can create a todo", %{conn: conn} do
    {:ok, view, _html} = live(conn, ~p"/todo")

    view
    |> form("#add-todo", %{todo: %{body: "Form fellowship"}})
    |> render_submit()

    assert has_element?(view, "[data-role=todo]", "Form fellowship")
  end

  test "user can create a todo (target event directly)", %{conn: conn} do
    {:ok, view, _html} = live(conn, ~p"/todo")

    view
    |> render_submit("create", %{todo: %{body: "Form fellowship"}})

    assert has_element?(view, "[data-role=todo]", "Form fellowship")
  end

  test "user can create a todo (with HTML)", %{conn: conn} do
    {:ok, view, _html} = live(conn, ~p"/todo")

    html =
      view
      |> form("#add-todo", %{todo: %{body: "Form fellowship"}})
      |> render_submit()

    assert html =~ "Form fellowship"
  end
end
