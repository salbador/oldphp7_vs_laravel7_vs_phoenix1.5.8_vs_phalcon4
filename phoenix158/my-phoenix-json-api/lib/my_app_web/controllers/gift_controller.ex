defmodule MyAppWeb.GiftController do
  use MyAppWeb, :controller

  alias MyApp.Account
  alias MyApp.Account.Gift

  action_fallback MyAppWeb.FallbackController

  def index(conn, _params) do
    gifts = Account.list_gifts()
    render(conn, "index.json", gifts: gifts)
  end

  def create(conn, %{"gift" => gift_params}) do
    with {:ok, %Gift{} = gift} <- Account.create_gift(gift_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.gift_path(conn, :show, gift))
      |> render("show.json", gift: gift)
    end
  end

  def show(conn, %{"id" => id}) do
    gift = Account.get_gift!(id)
    render(conn, "show.json", gift: gift)
  end

  def update(conn, %{"id" => id, "gift" => gift_params}) do
    gift = Account.get_gift!(id)

    with {:ok, %Gift{} = gift} <- Account.update_gift(gift, gift_params) do
      render(conn, "show.json", gift: gift)
    end
  end

  def delete(conn, %{"id" => id}) do
    gift = Account.get_gift!(id)

    with {:ok, %Gift{}} <- Account.delete_gift(gift) do
      send_resp(conn, :no_content, "")
    end
  end
end
