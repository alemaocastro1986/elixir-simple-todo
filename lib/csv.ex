defmodule Todo.Csv do
  alias Todo.Mapper

  @file_name if Mix.env() == :test, do: "files/todos_test.csv", else: "files/todos.csv"

  def to_list() do
    @file_name
    |> parser(";")
    |> Enum.map(&Mapper.to_map/1)
  end

  def update([h | t] = todos) do
    first = Mapper.to_csv(h, ";")

    content =
      t
      |> Enum.map(&("\r\n" <> Mapper.to_csv(&1, ";")))
      |> List.insert_at(0, first)

    File.write!(@file_name, content)
    todos
  end

  def clear() do
    File.write!(@file_name, "")
  end

  defp parser(file_name, delimiter) do
    file_name
    |> File.stream!()
    |> Stream.map(&parse_row(&1, delimiter))
  end

  defp parse_row(row, delimiter) do
    row
    |> String.trim()
    |> String.split(delimiter, trim: true)
    |> List.update_at(1, &parse_date/1)
  end

  defp parse_date(date_string) do
    [year, month, day] =
      date_string
      |> String.split("-")
      |> Enum.map(&String.to_integer/1)

    Date.new!(year, month, day)
  end
end
