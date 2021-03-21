defmodule AppWeb.ItemView do
  use AppWeb, :view
  # add class "completed" to a list item if item.status=1
  def complete(item) do
    case item.status do
      1 -> "completed"
      # empty string means empty class so no style applied
      _ -> ""
    end
  end

  # add "checked" to input if item.status=1
  def checked(item) do
    case item.status do
      1 -> "checked"
      # empty string means empty class so no style applied
      _ -> ""
    end
  end

  # returns integer value of items where item.status == 0 (not "done")
  def remaining_items(items) do
    Enum.filter(items, fn i -> i.status == 0 end) |> Enum.count()
  end

  def filter(items, str) do
    case str do
      "all" -> items
      "active" -> Enum.filter(items, fn i -> i.status == 0 end)
      "completed" -> Enum.filter(items, fn i -> i.status == 1 end)
    end
  end

  def selected(filter, str) do
    case filter == str do
      true -> "selected"
      false -> ""
    end
  end

  def pluralise(items) do
    case remaining_items(items) == 1 do
      true -> "item"
      false -> "items"
    end
  end

  def got_items?(items) do
    Enum.filter(items, fn i -> i.status < 2 end) |> Enum.count() > 0
  end
end
