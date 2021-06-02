defmodule FizzBuzz do
  def build(file_name) do
    # Usando pipe
    file_name
    |> File.read()
    |> handle_file_read()
  end

  # Usando pipe e função anônima resumida
  defp handle_file_read({:ok, result}) do
    result =
      result
      |> String.split(",")
      |> Enum.map(&convertAndEvaluateNumbers/1)

    {:ok, result}
  end

  defp handle_file_read({:error, reason}), do: {:error, "Error reading the file: #{reason}"}

  defp convertAndEvaluateNumbers(elem) do
    elem
    |> String.to_integer()
    |> evaluateNumbers()
  end

  defp evaluateNumbers(number) when rem(number, 3) == 0 and rem(number, 5) == 0, do: :fizzbuzz
  defp evaluateNumbers(number) when rem(number, 3) == 0, do: :fizz
  defp evaluateNumbers(number) when rem(number, 5) == 0, do: :buzz
  defp evaluateNumbers(number), do: number
end
