defmodule Av.Utils do
  def order(map) do
    Enum.to_list(map)
    |> List.keysort(0)
  end

  def to_chart(map) do
    map
    |> Map.values()
    |> Enum.at(1)
    |> order()
    |> Enum.map(fn x -> transform_to_array(x) end)

    #  |> List.insert_at(0, map_labels)
  end

  def get_oclh(map) do
    to_chart(map)
    |> Enum.map(fn x -> select(x, [1, 4, 3, 2]) end)
  end

  def get_fields(map, field_num) do
    to_chart(map)
    |> Enum.map(fn x -> Enum.at(x, field_num) end)
  end

  def get_fields(map, field_start, field_end) do
    to_chart(map)
    |> Enum.map(fn x -> Enum.slice(x, field_start, field_end) end)
  end

  def to_json_chart(map) do
    Poison.encode!(map)
  end

  def transform_to_array(list_elem) do
    elem_array = [elem(list_elem, 0)]
    map_values = elem(list_elem, 1) |> Map.values()
    elem_array ++ map_values
  end

  # selects and returns the given indices in a list from a list
  def select(map, indices) do
    Enum.map(indices, &Enum.at(map, &1))
  end
end
