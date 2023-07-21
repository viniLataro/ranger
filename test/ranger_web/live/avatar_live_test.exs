defmodule RangerWeb.AvatarLiveTest do
  @moduledoc false

  use RangerWeb.ConnCase

  import Phoenix.LiveViewTest

  alias Ranger.Gravatar

  test "renders avatar for given email", %{conn: conn} do
    email = "frodo@shire.com"
    avatar_url = Gravatar.generate(email)
    {:ok, _view, html} = live(conn, ~p"/avatar/#{email}")

    assert html =~ avatar_url
  end

  test "renders avatar image from given email", %{conn: conn} do
    email = "frodo@shire.com"
    avatar_url = Gravatar.generate(email)
    {:ok, view, _html} = live(conn, ~p"/avatar/#{email}")

    assert has_element?(view, ~s(img[src*="#{avatar_url}"]))
  end

  test "renders avatar image from given email better way", %{conn: conn} do
    email = "frodo@shire.com"
    avatar_url = Gravatar.generate(email)
    {:ok, view, _html} = live(conn, ~p"/avatar/#{email}")

    avatar = element(view, ~s(img[src*="#{avatar_url}"]))

    assert has_element?(avatar)
  end
end
