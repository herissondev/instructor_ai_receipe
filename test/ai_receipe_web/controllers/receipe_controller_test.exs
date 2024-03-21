defmodule AiReceipeWeb.ReceipeControllerTest do
  use AiReceipeWeb.ConnCase

  import AiReceipe.ReceipesFixtures

  alias AiReceipe.Receipes.Receipe

  @create_attrs %{

  }
  @update_attrs %{

  }
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all receipes", %{conn: conn} do
      conn = get(conn, ~p"/api/receipes")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create receipe" do
    test "renders receipe when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/receipes", receipe: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/receipes/#{id}")

      assert %{
               "id" => ^id
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/receipes", receipe: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update receipe" do
    setup [:create_receipe]

    test "renders receipe when data is valid", %{conn: conn, receipe: %Receipe{id: id} = receipe} do
      conn = put(conn, ~p"/api/receipes/#{receipe}", receipe: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/receipes/#{id}")

      assert %{
               "id" => ^id
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, receipe: receipe} do
      conn = put(conn, ~p"/api/receipes/#{receipe}", receipe: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete receipe" do
    setup [:create_receipe]

    test "deletes chosen receipe", %{conn: conn, receipe: receipe} do
      conn = delete(conn, ~p"/api/receipes/#{receipe}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/receipes/#{receipe}")
      end
    end
  end

  defp create_receipe(_) do
    receipe = receipe_fixture()
    %{receipe: receipe}
  end
end
