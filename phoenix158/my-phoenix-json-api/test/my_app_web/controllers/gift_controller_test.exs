defmodule MyAppWeb.GiftControllerTest do
  use MyAppWeb.ConnCase

  alias MyApp.Account
  alias MyApp.Account.Gift

  @create_attrs %{
    categories: [],
    name: "some name"
  }
  @update_attrs %{
    categories: [],
    name: "some updated name"
  }
  @invalid_attrs %{categories: nil, name: nil}

  def fixture(:gift) do
    {:ok, gift} = Account.create_gift(@create_attrs)
    gift
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all gifts", %{conn: conn} do
      conn = get(conn, Routes.gift_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create gift" do
    test "renders gift when data is valid", %{conn: conn} do
      conn = post(conn, Routes.gift_path(conn, :create), gift: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.gift_path(conn, :show, id))

      assert %{
               "id" => id,
               "categories" => [],
               "name" => "some name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.gift_path(conn, :create), gift: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update gift" do
    setup [:create_gift]

    test "renders gift when data is valid", %{conn: conn, gift: %Gift{id: id} = gift} do
      conn = put(conn, Routes.gift_path(conn, :update, gift), gift: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.gift_path(conn, :show, id))

      assert %{
               "id" => id,
               "categories" => [],
               "name" => "some updated name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, gift: gift} do
      conn = put(conn, Routes.gift_path(conn, :update, gift), gift: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete gift" do
    setup [:create_gift]

    test "deletes chosen gift", %{conn: conn, gift: gift} do
      conn = delete(conn, Routes.gift_path(conn, :delete, gift))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.gift_path(conn, :show, gift))
      end
    end
  end

  defp create_gift(_) do
    gift = fixture(:gift)
    %{gift: gift}
  end
end
