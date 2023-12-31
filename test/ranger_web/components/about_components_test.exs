defmodule RangerWeb.AboutComponentsTest do
  @moduledoc false

  use ExUnit.Case, async: true

  import Phoenix.Component
  import Phoenix.LiveViewTest

  import RangerWeb.AboutComponents

  describe "badge" do
    test "renders content in badge (render_component)" do
      component = render_component(&badge/1, type: "hobbit")

      assert component =~ "hobbit"

    end

    test "renders content in badge (HEEX)" do
      assigns = %{}

      component =
        rendered_to_string(
          ~H"""
            <.badge type="hobbit" />
          """
        )

      assert component =~ "hobbit"
    end

    test "renders green badge for hobbits" do
      assigns = %{}

      component =
        rendered_to_string(
          ~H"""
            <.badge type="hobbit" />
          """
        )

      assert component =~ "bg-green"
    end

    test "renders red badge for wizards" do
      assigns = %{}

      component =
        rendered_to_string(
          ~H"""
            <.badge type="wizard" />
          """
        )

      assert component =~ "bg-red"
    end

    test "renders blue badge for humans" do
      assigns = %{}

      component =
        rendered_to_string(
          ~H"""
            <.badge type="human" />
          """
        )

      assert component =~ "bg-blue"
    end

    test "renders gray badge for elfs" do
      assigns = %{}

      component =
        rendered_to_string(
          ~H"""
            <.badge type="elf" />
          """
        )

      assert component =~ "bg-gray"
    end

    test "renders yellow badge for dwarves" do
      assigns = %{}

      component =
        rendered_to_string(
          ~H"""
            <.badge type="dwarf" />
          """
        )

      assert component =~ "bg-yellow"
    end
  end

  describe "card" do
    test "renders title and inner content" do
      assigns = %{}

      component =
        rendered_to_string(
          ~H"""
            <.card>
              <:title>some title</:title>
              some inner content
            </.card>
          """
        )

      assert component =~ "some title"
      assert component =~ "some inner content"
    end
  end
end
