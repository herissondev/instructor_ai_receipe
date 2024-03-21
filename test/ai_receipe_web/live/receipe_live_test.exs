defmodule AiRecipeWeb.RecipeLiveTest do
  use AiRecipeWeb.ConnCase

  import Phoenix.LiveViewTest
  import AiRecipe.RecipesFixtures

  @create_attrs %{}
  @update_attrs %{}
  @invalid_attrs %{}

  defp create_recipe(_) do
    recipe = recipe_fixture()
    %{recipe: recipe}
  end

  describe "Index" do
    setup [:create_recipe]

    test "lists all recipes", %{conn: conn} do
      {:ok, _index_live, html} = live(conn, ~p"/recipes")

      assert html =~ "Listing Recipes"
    end

    test "saves new recipe", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, ~p"/recipes")

      assert index_live |> element("a", "New Recipe") |> render_click() =~
               "New Recipe"

      assert_patch(index_live, ~p"/recipes/new")

      assert index_live
             |> form("#recipe-form", recipe: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#recipe-form", recipe: @create_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/recipes")

      html = render(index_live)
      assert html =~ "Recipe created successfully"
    end

    test "updates recipe in listing", %{conn: conn, recipe: recipe} do
      {:ok, index_live, _html} = live(conn, ~p"/recipes")

      assert index_live |> element("#recipes-#{recipe.id} a", "Edit") |> render_click() =~
               "Edit Recipe"

      assert_patch(index_live, ~p"/recipes/#{recipe}/edit")

      assert index_live
             |> form("#recipe-form", recipe: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#recipe-form", recipe: @update_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/recipes")

      html = render(index_live)
      assert html =~ "Recipe updated successfully"
    end

    test "deletes recipe in listing", %{conn: conn, recipe: recipe} do
      {:ok, index_live, _html} = live(conn, ~p"/recipes")

      assert index_live |> element("#recipes-#{recipe.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#recipes-#{recipe.id}")
    end
  end

  describe "Show" do
    setup [:create_recipe]

    test "displays recipe", %{conn: conn, recipe: recipe} do
      {:ok, _show_live, html} = live(conn, ~p"/recipes/#{recipe}")

      assert html =~ "Show Recipe"
    end

    test "updates recipe within modal", %{conn: conn, recipe: recipe} do
      {:ok, show_live, _html} = live(conn, ~p"/recipes/#{recipe}")

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Recipe"

      assert_patch(show_live, ~p"/recipes/#{recipe}/show/edit")

      assert show_live
             |> form("#recipe-form", recipe: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert show_live
             |> form("#recipe-form", recipe: @update_attrs)
             |> render_submit()

      assert_patch(show_live, ~p"/recipes/#{recipe}")

      html = render(show_live)
      assert html =~ "Recipe updated successfully"
    end
  end
end
