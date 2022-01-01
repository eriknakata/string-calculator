defmodule StringCalculator do
  def add(string_numbers) when string_numbers == "" do
    0
  end

  def add(string_numbers) do
    {values, delimiter} = extract_values_and_numbers(string_numbers)

    extract_numbers(values, delimiter) |> validate_numbers() |> filter_invalid_numbers |> sum()
  end

  defp filter_invalid_numbers(numbers) do
    numbers |> Enum.filter(fn number -> number <= 1000 end)
  end

  defp validate_numbers(numbers) do
    negative_numbers = Enum.filter(numbers, fn number -> number < 0 end)

    case negative_numbers do
      numbers when numbers != [] -> raise "negatives not allowed #{Enum.join(numbers, ",")}"
      _ -> numbers
    end
  end

  defp sum(numbers) do
    Enum.reduce(numbers, 0, fn number, acc -> number + acc end)
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

    case String.contains?(delimiter, ["[", "]"]) do
      true ->
        String.slice(delimiter, 2, String.length(delimiter))
        |> String.replace_leading("[", "")
        |> String.replace_suffix("]", "")

      false ->
        String.at(delimiter, 2)
    end
  end

  defp extract_numbers(string, delimiter) do
    String.split(string, delimiter) |> Enum.map(fn number -> String.to_integer(number) end)
  end
end
