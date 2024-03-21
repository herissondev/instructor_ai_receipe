defmodule AiReceipe.ReceipesTest do
  use AiReceipe.DataCase

  alias AiReceipe.Receipes

  describe "receipes" do
    alias AiReceipe.Receipes.Receipe

    import AiReceipe.ReceipesFixtures

    @invalid_attrs %{}

    test "list_receipes/0 returns all receipes" do
      receipe = receipe_fixture()
      assert Receipes.list_receipes() == [receipe]
    end

    test "get_receipe!/1 returns the receipe with given id" do
      receipe = receipe_fixture()
      assert Receipes.get_receipe!(receipe.id) == receipe
    end

    test "create_receipe/1 with valid data creates a receipe" do
      valid_attrs = %{}

      assert {:ok, %Receipe{} = receipe} = Receipes.create_receipe(valid_attrs)
    end

    test "create_receipe/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Receipes.create_receipe(@invalid_attrs)
    end

    test "update_receipe/2 with valid data updates the receipe" do
      receipe = receipe_fixture()
      update_attrs = %{}

      assert {:ok, %Receipe{} = receipe} = Receipes.update_receipe(receipe, update_attrs)
    end

    test "update_receipe/2 with invalid data returns error changeset" do
      receipe = receipe_fixture()
      assert {:error, %Ecto.Changeset{}} = Receipes.update_receipe(receipe, @invalid_attrs)
      assert receipe == Receipes.get_receipe!(receipe.id)
    end

    test "delete_receipe/1 deletes the receipe" do
      receipe = receipe_fixture()
      assert {:ok, %Receipe{}} = Receipes.delete_receipe(receipe)
      assert_raise Ecto.NoResultsError, fn -> Receipes.get_receipe!(receipe.id) end
    end

    test "change_receipe/1 returns a receipe changeset" do
      receipe = receipe_fixture()
      assert %Ecto.Changeset{} = Receipes.change_receipe(receipe)
    end
  end
end
