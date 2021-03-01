defmodule MyAppWeb.GiftView do
  use MyAppWeb, :view
  alias MyAppWeb.GiftView

  def render("index.json", %{gifts: gifts}) do
    %{data: render_many(gifts, GiftView, "gift.json")}
  end

  def render("show.json", %{gift: gift}) do
    %{data: render_one(gift, GiftView, "gift.json")}
  end

  def render("gift.json", %{gift: gift}) do
    %{id: gift.id,
      name: gift.name,
      categories: gift.categories}
  end
end
