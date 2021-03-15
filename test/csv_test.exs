defmodule Todo.CsvTest do
  use ExUnit.Case
  alias Todo.Csv
  alias Todo.Mapper

  setup do
    Csv.clear()
  end

  describe "to_list/0" do
    test "should return a list of todos parsed" do
      todos =
        Csv.update([%{description: "teste 3", start_date: ~D[2021-04-22], status: "pending"}])

      assert todos == Csv.to_list()
    end
  end

  describe "update/1" do
    test "should return a list of todos updated" do
      assert [
               %{description: "teste 3", start_date: ~D[2021-04-22], status: "pending"},
               %{description: "teste 4", start_date: ~D[2021-04-22], status: "pending"}
             ] =
               Csv.update([
                 %{description: "teste 3", start_date: ~D[2021-04-22], status: "pending"},
                 %{description: "teste 4", start_date: ~D[2021-04-22], status: "pending"}
               ])
    end
  end

  describe "clear/0" do
    test "should return an empty list of todos" do
      Csv.clear()
      assert [] = Csv.to_list()
    end
  end
end
