defmodule FizzBuzz do
  def build(file_name) do
    # Usando case para tratar
    # case File.read(file_name) do
    #   {:ok, result} -> result
    #   {:error, reason} -> reason
    # end

    # Usando maneira estruturada
    file = File.read(file_name)
    handle_file_read(file)
  end

  # Usando forma estruturada
  def handle_file_read({:ok, result}) do
    list = String.split(result, ",")
    Enum.map(list, fn number -> String.to_integer(number) end)
  end

  def handle_file_read({:error, reason}), do: "Error reading the file: #{reason}"
end
