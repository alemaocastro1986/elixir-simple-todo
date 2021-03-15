defmodule Todo.Mapper do
  def to_map([description, start_date, status]) do
    %{description: description, start_date: start_date, status: status}
  end

  def to_csv(
        %{description: description, start_date: start_date, status: status},
        delimiter \\ ","
      ) do
    [description, start_date, status]
    |> Enum.join(delimiter)
  end
end
