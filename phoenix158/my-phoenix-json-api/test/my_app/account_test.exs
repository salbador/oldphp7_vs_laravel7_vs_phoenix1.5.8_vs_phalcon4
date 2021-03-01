defmodule MyApp.AccountTest do
  use MyApp.DataCase

  alias MyApp.Account

  describe "users" do
    alias MyApp.Account.User

    @valid_attrs %{email: "some email", is_active: true, password: "some password"}
    @update_attrs %{
      email: "some updated email",
      is_active: false,
      password: "some updated password"
    }
    @invalid_attrs %{email: nil, is_active: nil, password: nil}

    def user_fixture(attrs \\ %{}) do
      {:ok, user} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Account.create_user()

      user
    end

    def user_without_password(attrs \\ %{}) do
      %{user_fixture(attrs) | password: nil}
    end

    test "list_users/0 returns all users" do
      user = user_without_password()
      assert Account.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_without_password()
      assert Account.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      assert {:ok, %User{} = user} = Account.create_user(@valid_attrs)
      assert user.email == "some email"
      assert user.is_active == true
      assert Bcrypt.verify_pass("some password", user.password_hash)
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Account.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_without_password()
      assert {:ok, %User{} = user} = Account.update_user(user, @update_attrs)
      assert user.email == "some updated email"
      assert user.is_active == false
      assert Bcrypt.verify_pass("some updated password", user.password_hash)
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_without_password()
      assert {:error, %Ecto.Changeset{}} = Account.update_user(user, @invalid_attrs)
      assert user == Account.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_without_password()
      assert {:ok, %User{}} = Account.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Account.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_without_password()
      assert %Ecto.Changeset{} = Account.change_user(user)
    end

    test "authenticate_user/2 authenticates the user" do
      user = user_without_password()

      assert {:error, "Wrong email or password"} = Account.authenticate_user("wrong email", "")

      assert {:ok, authenticated_user} =
               Account.authenticate_user(user.email, @valid_attrs.password)

      assert user == authenticated_user
    end
  end

  describe "employees" do
    alias MyApp.Account.Employee

    @valid_attrs %{interests: [], name: "some name"}
    @update_attrs %{interests: [], name: "some updated name"}
    @invalid_attrs %{interests: nil, name: nil}

    def employee_fixture(attrs \\ %{}) do
      {:ok, employee} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Account.create_employee()

      employee
    end

    test "list_employees/0 returns all employees" do
      employee = employee_fixture()
      assert Account.list_employees() == [employee]
    end

    test "get_employee!/1 returns the employee with given id" do
      employee = employee_fixture()
      assert Account.get_employee!(employee.id) == employee
    end

    test "create_employee/1 with valid data creates a employee" do
      assert {:ok, %Employee{} = employee} = Account.create_employee(@valid_attrs)
      assert employee.interests == []
      assert employee.name == "some name"
    end

    test "create_employee/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Account.create_employee(@invalid_attrs)
    end

    test "update_employee/2 with valid data updates the employee" do
      employee = employee_fixture()
      assert {:ok, %Employee{} = employee} = Account.update_employee(employee, @update_attrs)
      assert employee.interests == []
      assert employee.name == "some updated name"
    end

    test "update_employee/2 with invalid data returns error changeset" do
      employee = employee_fixture()
      assert {:error, %Ecto.Changeset{}} = Account.update_employee(employee, @invalid_attrs)
      assert employee == Account.get_employee!(employee.id)
    end

    test "delete_employee/1 deletes the employee" do
      employee = employee_fixture()
      assert {:ok, %Employee{}} = Account.delete_employee(employee)
      assert_raise Ecto.NoResultsError, fn -> Account.get_employee!(employee.id) end
    end

    test "change_employee/1 returns a employee changeset" do
      employee = employee_fixture()
      assert %Ecto.Changeset{} = Account.change_employee(employee)
    end
  end

  describe "gifts" do
    alias MyApp.Account.Gift

    @valid_attrs %{categories: [], name: "some name"}
    @update_attrs %{categories: [], name: "some updated name"}
    @invalid_attrs %{categories: nil, name: nil}

    def gift_fixture(attrs \\ %{}) do
      {:ok, gift} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Account.create_gift()

      gift
    end

    test "list_gifts/0 returns all gifts" do
      gift = gift_fixture()
      assert Account.list_gifts() == [gift]
    end

    test "get_gift!/1 returns the gift with given id" do
      gift = gift_fixture()
      assert Account.get_gift!(gift.id) == gift
    end

    test "create_gift/1 with valid data creates a gift" do
      assert {:ok, %Gift{} = gift} = Account.create_gift(@valid_attrs)
      assert gift.categories == []
      assert gift.name == "some name"
    end

    test "create_gift/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Account.create_gift(@invalid_attrs)
    end

    test "update_gift/2 with valid data updates the gift" do
      gift = gift_fixture()
      assert {:ok, %Gift{} = gift} = Account.update_gift(gift, @update_attrs)
      assert gift.categories == []
      assert gift.name == "some updated name"
    end

    test "update_gift/2 with invalid data returns error changeset" do
      gift = gift_fixture()
      assert {:error, %Ecto.Changeset{}} = Account.update_gift(gift, @invalid_attrs)
      assert gift == Account.get_gift!(gift.id)
    end

    test "delete_gift/1 deletes the gift" do
      gift = gift_fixture()
      assert {:ok, %Gift{}} = Account.delete_gift(gift)
      assert_raise Ecto.NoResultsError, fn -> Account.get_gift!(gift.id) end
    end

    test "change_gift/1 returns a gift changeset" do
      gift = gift_fixture()
      assert %Ecto.Changeset{} = Account.change_gift(gift)
    end
  end
end
