defmodule FizzBuzz do
  def build(file_name) do
    # Usando case para tratar
    # case File.read(file_name) do
    #   {:ok, result} -> result
    #   {:error, reason} -> reason
    # end

    # Usando maneira estruturada
    # file = File.read(file_name)
    # handle_file_read(file)

    # Usando pipe
    file_name
    |> File.read()
    |> handle_file_read()
  end

  # Usando forma estruturada
  # def handle_file_read({:ok, result}) do
  #   list = String.split(result, ",")
  #   Enum.map(list, fn number -> String.to_integer(number) end)
  # end

  # Usando pipe e função anônima resumida
  def handle_file_read({:ok, result}) do
    result
    |> String.split(",")
    |> Enum.map(&String.to_integer/1)
  end

  def handle_file_read({:error, reason}), do: "Error reading the file: #{reason}"
end
