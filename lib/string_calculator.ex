defmodule StringCalculator do
  def add(numbers) when numbers != "" do
    case String.split(numbers, ",") do
      [num1] -> String.to_integer(num1)
      [num1, num2] -> String.to_integer(num1) + String.to_integer(num2)
    end
  end

  def add(_) do
    0
  end
end
