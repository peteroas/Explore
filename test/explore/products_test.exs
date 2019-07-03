defmodule Explore.ProductsTest do
  use Explore.DataCase

  alias Explore.Products

  describe "items" do
    alias Explore.Products.Item

    @valid_attrs %{name: "some name", price: 120.5}
    @update_attrs %{name: "some updated name", price: 456.7}
    @invalid_attrs %{name: nil, price: nil}

    def item_fixture(attrs \\ %{}) do
      {:ok, item} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Products.create_item()

      item
    end

    test "list_items/0 returns all items" do
      item = item_fixture()
      assert Products.list_items() == [item]
    end

    test "get_item!/1 returns the item with given id" do
      item = item_fixture()
      assert Products.get_item!(item.id) == item
    end

    test "create_item/1 with valid data creates a item" do
      assert {:ok, %Item{} = item} = Products.create_item(@valid_attrs)
      assert item.name == "some name"
      assert item.price == 120.5
    end

    test "create_item/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Products.create_item(@invalid_attrs)
    end

    test "update_item/2 with valid data updates the item" do
      item = item_fixture()
      assert {:ok, %Item{} = item} = Products.update_item(item, @update_attrs)
      assert item.name == "some updated name"
      assert item.price == 456.7
    end

    test "update_item/2 with invalid data returns error changeset" do
      item = item_fixture()
      assert {:error, %Ecto.Changeset{}} = Products.update_item(item, @invalid_attrs)
      assert item == Products.get_item!(item.id)
    end

    test "delete_item/1 deletes the item" do
      item = item_fixture()
      assert {:ok, %Item{}} = Products.delete_item(item)
      assert_raise Ecto.NoResultsError, fn -> Products.get_item!(item.id) end
    end

    test "change_item/1 returns a item changeset" do
      item = item_fixture()
      assert %Ecto.Changeset{} = Products.change_item(item)
    end
  end
end
