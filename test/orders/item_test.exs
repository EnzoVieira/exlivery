defmodule Exlivery.Orders.ItemTest do
  use ExUnit.Case

  alias Exlivery.Orders.Item

  import Exlivery.Factory

  describe "build/4" do
    test "when all params are valid, return an item" do
      response = Item.build("Pizza de peperoni", :pizza, "35.50", 1)

      expected_response = {:ok, build(:item)}

      assert response == expected_response
    end

    test "when there is an invalid category, returns an error" do
      response = Item.build("Pizza de peperoni", :banana, "35.50", 1)

      expected_response = {:error, "Invalid parameters!"}

      assert response == expected_response
    end

    test "when there is an invalid price, returns an error" do
      response = Item.build("Pizza de peperoni", :banana, "banana_price", 1)

      expected_response = {:error, "Invalid parameters!"}

      assert response == expected_response
    end

    test "when there is an invalid quantity, returns an error" do
      response = Item.build("Pizza de peperoni", :banana, "35.50", 0)

      expected_response = {:error, "Invalid parameters!"}

      assert response == expected_response
    end
  end
end
