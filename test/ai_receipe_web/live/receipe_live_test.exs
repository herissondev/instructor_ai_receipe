defmodule AiReceipeWeb.ReceipeLiveTest do
  use AiReceipeWeb.ConnCase

  import Phoenix.LiveViewTest
  import AiReceipe.ReceipesFixtures

  @create_attrs %{}
  @update_attrs %{}
  @invalid_attrs %{}

  defp create_receipe(_) do
    receipe = receipe_fixture()
    %{receipe: receipe}
  end

  describe "Index" do
    setup [:create_receipe]

    test "lists all receipes", %{conn: conn} do
      {:ok, _index_live, html} = live(conn, ~p"/receipes")

      assert html =~ "Listing Receipes"
    end

    test "saves new receipe", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, ~p"/receipes")

      assert index_live |> element("a", "New Receipe") |> render_click() =~
               "New Receipe"

      assert_patch(index_live, ~p"/receipes/new")

      assert index_live
             |> form("#receipe-form", receipe: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#receipe-form", receipe: @create_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/receipes")

      html = render(index_live)
      assert html =~ "Receipe created successfully"
    end

    test "updates receipe in listing", %{conn: conn, receipe: receipe} do
      {:ok, index_live, _html} = live(conn, ~p"/receipes")

      assert index_live |> element("#receipes-#{receipe.id} a", "Edit") |> render_click() =~
               "Edit Receipe"

      assert_patch(index_live, ~p"/receipes/#{receipe}/edit")

      assert index_live
             |> form("#receipe-form", receipe: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#receipe-form", receipe: @update_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/receipes")

      html = render(index_live)
      assert html =~ "Receipe updated successfully"
    end

    test "deletes receipe in listing", %{conn: conn, receipe: receipe} do
      {:ok, index_live, _html} = live(conn, ~p"/receipes")

      assert index_live |> element("#receipes-#{receipe.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#receipes-#{receipe.id}")
    end
  end

  describe "Show" do
    setup [:create_receipe]

    test "displays receipe", %{conn: conn, receipe: receipe} do
      {:ok, _show_live, html} = live(conn, ~p"/receipes/#{receipe}")

      assert html =~ "Show Receipe"
    end

    test "updates receipe within modal", %{conn: conn, receipe: receipe} do
      {:ok, show_live, _html} = live(conn, ~p"/receipes/#{receipe}")

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Receipe"

      assert_patch(show_live, ~p"/receipes/#{receipe}/show/edit")

      assert show_live
             |> form("#receipe-form", receipe: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert show_live
             |> form("#receipe-form", receipe: @update_attrs)
             |> render_submit()

      assert_patch(show_live, ~p"/receipes/#{receipe}")

      html = render(show_live)
      assert html =~ "Receipe updated successfully"
    end
  end
end
