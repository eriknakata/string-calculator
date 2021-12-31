defmodule StringCalculator do
  def add(string_numbers) do
    {values, delimiter} = extract_values_and_numbers(string_numbers)

    extract_numbers(values, delimiter) |> sum()
  end

  defp sum(numbers) when numbers == [""] do
    0
  end

  defp sum(numbers) do
    Enum.reduce(numbers, 0, fn number, acc -> String.to_integer(number) + acc end)
  end

  defp has_delimiter(string_numbers) do
    String.starts_with?(string_numbers, "//")
  end

  defp extract_values_and_numbers(string_numbers) do
    case has_delimiter(string_numbers) do
      true -> {extract_values(string_numbers), extract_delimiter(string_numbers)}
      false -> {string_numbers, [",", "\n"]}
    end
  end

  defp extract_values(string_numbers) do
    [_, values] = String.split(string_numbers, "\n", parts: 2)
    values
  end

  defp extract_delimiter(string_numbers) do
    [delimiter, _] = String.split(string_numbers, "\n", parts: 2)
    String.at(delimiter, 2)
  end

  defp extract_numbers(string, delimiter) do
    String.split(string, delimiter)
  end
end
