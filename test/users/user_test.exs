defmodule Exlivery.Users.UserTest do
  use ExUnit.Case

  alias Exlivery.Users.User

  describe "build/5" do
    test "when all params are valid, return the user" do
      response = User.build("Rua das bananeiras", "Enzo", "email@email.com", "123456", 20)

      expected_response =
        {:ok,
         %Exlivery.Users.User{
           address: "Rua das bananeiras",
           age: 20,
           cpf: "123456",
           email: "email@email.com",
           name: "Enzo"
         }}

      assert response == expected_response
    end

    test "when there are invalid params, returns an error" do
      response = User.build("Rua das bananeiras", "Enzo Jr.", "email@email.com", "123456", 15)

      expected_response = {:error, "Invalid parameters"}

      assert response == expected_response
    end
  end
end
