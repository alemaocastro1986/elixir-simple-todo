defmodule TodoTest do
  use ExUnit.Case

  alias Todo.Csv

  setup do
    Csv.clear()

    todos =
      Csv.update([
        %{description: "teste 3", start_date: ~D[2021-04-22], status: "pending"},
        %{description: "teste 4", start_date: ~D[2021-04-22], status: "pending"}
      ])

    %{todos: todos}
  end

  describe "list/0" do
    test "should return a list of todos", %{todos: todos} do
      assert todos == Todo.list()
    end
  end

  describe "add/1" do
    test "should return a new" do
      assert {:ok, %{description: "new todo", start_date: ~D[2021-03-25], status: "pending"}} =
               Todo.add(%{description: "new todo", start_date: ~D[2021-03-25]})

      assert List.last(Csv.to_list()) == %{
               description: "new todo",
               start_date: ~D[2021-03-25],
               status: "pending"
             }
    end

    test "should return an error, when invalid parameter" do
      assert {:error, "todo not is map or malformad"} = Todo.add("not-map")
      assert {:error, "todo not is map or malformad"} = Todo.add(%{})
    end
  end

  describe "update/2" do
    test "should return a todo updated", %{todos: todos} do
      sut = Todo.update(1, %{description: "todo updated"})

      expected =
        {:ok, %{description: "todo updated", start_date: ~D[2021-04-22], status: "pending"}}

      assert sut == expected
    end

    test "should return an error, when invalid parameters" do
      assert {:error, "invalid value, enter an integer and todo map."} = Todo.update("1", %{})
      assert {:error, "invalid value, enter an integer and todo map."} = Todo.update(1, "string")
      assert {:error, "invalid value, enter an integer and todo map."} = Todo.update("", "string")
    end
  end

  describe "id_done/1" do
    test "return a todo with status done", %{todos: todos} do
      sut = Todo.its_done(0)
      expected = {:ok, %{description: "teste 3", start_date: ~D[2021-04-22], status: "done"}}

      assert sut == expected
    end

    test "return an error, when invalid params" do
      assert {:error, "invalid value, enter an integer"} = Todo.its_done(%{invalid: true})
      assert {:error, "invalid value, enter an integer"} = Todo.its_done("")
      assert {:error, "invalid value, enter an integer"} = Todo.its_done([])
      assert {:error, "invalid value, enter an integer"} = Todo.its_done("1")
    end
  end

  describe "delete/1" do
    test "shoud return a message :ok when removed successfully" do
      assert {:ok, "todo 0 deleted."} = Todo.delete(0)
      assert length(Todo.list()) == 1
    end

    test "return an error, when invalid params" do
      assert {:error, "invalid value, enter an integer"} = Todo.delete(%{invalid: true})
      assert {:error, "invalid value, enter an integer"} = Todo.delete("")
      assert {:error, "invalid value, enter an integer"} = Todo.delete([])
      assert {:error, "invalid value, enter an integer"} = Todo.delete("1")
    end
  end
end
