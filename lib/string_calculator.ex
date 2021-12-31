defmodule StringCalculator do
  def add(numbers) do
    case String.split(numbers, ",") do
      [""] -> 0
      numbers -> Enum.reduce(numbers, 0, fn number, acc -> String.to_integer(number) + acc end)
    end
  end
end
