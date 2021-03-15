defmodule Todo.MapperTest do
  use ExUnit.Case

  alias Todo.Mapper

  describe "to_map/1" do
    test "should return a array to" do
      sut = Mapper.to_map(["study elixir", ~D[2021-03-12], "done"])
      expected = %{description: "study elixir", start_date: ~D[2021-03-12], status: "done"}

      assert sut == expected
    end
  end

  describe "to_csv/2" do
    test "should return a string formatted to csv with delimiter equal ';'" do
      sut =
        Mapper.to_csv(
          %{description: "study elixir", start_date: ~D[2021-03-12], status: "done"},
          ";"
        )

      expected = "study elixir;2021-03-12;done"

      assert sut == expected
    end

    test "should return a string formatted to csv with delimiter equal ','" do
      sut =
        Mapper.to_csv(
          %{description: "study elixir", start_date: ~D[2021-03-12], status: "done"},
          ","
        )

      expected = "study elixir,2021-03-12,done"

      assert sut == expected
    end
  end
end
