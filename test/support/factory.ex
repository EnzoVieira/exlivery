defmodule Exlivery.Factory do
  use ExMachina

  alias Exlivery.Users.User

  def user_factory do
    %User{
      name: "Enzo",
      email: "email@email.com",
      cpf: "123456",
      age: 20,
      address: "Rua das bananeiras"
    }
  end
end
