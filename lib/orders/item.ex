defmodule Exlivery.Orders.Item do
  @categories [:pizza, :hamburguer, :carne, :prato_feito, :japonesa, :sobremesa]

  @keys [:description, :category, :unity_price, :quantity]
  @enforce_keys @keys

  defstruct @keys

  def build(description, category, unity_price, quantity)
      when quantity > 0 and category in @categories do
    unity_price
    |> Decimal.cast()
    |> build_item(description, category, quantity)
  end

  def build(_, _, _, _), do: {:error, "Invalid parameters!"}

  defp build_item({:ok, unity_price}, description, category, quantity) do
    {:ok,
     %__MODULE__{
       description: description,
       category: category,
       unity_price: unity_price,
       quantity: quantity
     }}
  end

  defp build_item(:error, _, _, _), do: {:error, "Invalid price"}
end
