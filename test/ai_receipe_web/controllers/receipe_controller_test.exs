defmodule AiRecipeWeb.RecipeControllerTest do
  use AiRecipeWeb.ConnCase

  import AiRecipe.RecipesFixtures

  alias AiRecipe.Recipes.Recipe

  @create_attrs %{

  }
  @update_attrs %{

  }
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all recipes", %{conn: conn} do
      conn = get(conn, ~p"/api/recipes")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create recipe" do
    test "renders recipe when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/recipes", recipe: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/recipes/#{id}")

      assert %{
               "id" => ^id
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/recipes", recipe: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update recipe" do
    setup [:create_recipe]

    test "renders recipe when data is valid", %{conn: conn, recipe: %Recipe{id: id} = recipe} do
      conn = put(conn, ~p"/api/recipes/#{recipe}", recipe: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/recipes/#{id}")

      assert %{
               "id" => ^id
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, recipe: recipe} do
      conn = put(conn, ~p"/api/recipes/#{recipe}", recipe: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete recipe" do
    setup [:create_recipe]

    test "deletes chosen recipe", %{conn: conn, recipe: recipe} do
      conn = delete(conn, ~p"/api/recipes/#{recipe}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/recipes/#{recipe}")
      end
    end
  end

  defp create_recipe(_) do
    recipe = recipe_fixture()
    %{recipe: recipe}
  end
end
