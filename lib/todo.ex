defmodule Todo do
  alias Todo.Csv

  def list() do
    Csv.to_list()
  end

  def add(todo) when not is_map(todo) or map_size(todo) == 0,
    do: {:error, "todo not is map or malformad"}

  def add(%{description: _d, start_date: _dt} = todo) do
    todo = Map.merge(todo, %{status: "pending"})

    (list() ++ [todo])
    |> Csv.update()

    {:ok, todo}
  end

  def update(index, todo) when not is_integer(index) or not is_map(todo),
    do: {:error, "invalid value, enter an integer and todo map."}

  def update(index, todo) do
    todo =
      list()
      |> List.update_at(index, &Map.merge(&1, todo))
      |> Csv.update()
      |> Enum.at(index)

    {:ok, todo}
  end

  def its_done(index) when not is_integer(index), do: {:error, "invalid value, enter an integer"}

  def its_done(index) do
    update(index, %{status: "done"})
  end

  def delete(index) when not is_integer(index), do: {:error, "invalid value, enter an integer"}

  def delete(index) do
    list()
    |> List.delete_at(index)
    |> Csv.update()

    {:ok, "todo #{index} deleted."}
  end
end
