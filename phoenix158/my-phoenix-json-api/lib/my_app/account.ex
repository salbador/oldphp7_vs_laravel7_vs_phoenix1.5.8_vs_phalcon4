defmodule MyApp.Account do
  @moduledoc """
  The Account context.
  """

  import Ecto.Query, warn: false
  alias MyApp.Repo

  alias MyApp.Account.User

  @doc """
  Returns the list of users.

  ## Examples

      iex> list_users()
      [%User{}, ...]

  """
  def list_users do
    Repo.all(User)
  end

  @doc """
  Gets a single user.

  Raises `Ecto.NoResultsError` if the User does not exist.

  ## Examples

      iex> get_user!(123)
      %User{}

      iex> get_user!(456)
      ** (Ecto.NoResultsError)

  """
  def get_user!(id), do: Repo.get!(User, id)

  @doc """
  Creates a user.

  ## Examples

      iex> create_user(%{field: value})
      {:ok, %User{}}

      iex> create_user(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_user(attrs \\ %{}) do
    %User{}
    |> User.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a user.

  ## Examples

      iex> update_user(user, %{field: new_value})
      {:ok, %User{}}

      iex> update_user(user, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_user(%User{} = user, attrs) do
    user
    |> User.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a user.

  ## Examples

      iex> delete_user(user)
      {:ok, %User{}}

      iex> delete_user(user)
      {:error, %Ecto.Changeset{}}

  """
  def delete_user(%User{} = user) do
    Repo.delete(user)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking user changes.

  ## Examples

      iex> change_user(user)
      %Ecto.Changeset{data: %User{}}

  """
  def change_user(%User{} = user, attrs \\ %{}) do
    User.changeset(user, attrs)
  end

  def authenticate_user(email, password) do
    query = from(u in User, where: u.email == ^email)
    query |> Repo.one() |> verify_password(password)
  end

  defp verify_password(nil, _) do
    # Perform a dummy check to make user enumeration more difficult
    Bcrypt.no_user_verify()
    {:error, "Wrong email or password"}
  end

  defp verify_password(user, password) do
    if Bcrypt.verify_pass(password, user.password_hash) do
      {:ok, user}
    else
      {:error, "Wrong email or password"}
    end
  end

  alias MyApp.Account.Employee

  @doc """
  Returns the list of employees.

  ## Examples

      iex> list_employees()
      [%Employee{}, ...]

  """
  def list_employees do
    Repo.all(Employee)
  end

  @doc """
  Gets a single employee.

  Raises `Ecto.NoResultsError` if the Employee does not exist.

  ## Examples

      iex> get_employee!(123)
      %Employee{}

      iex> get_employee!(456)
      ** (Ecto.NoResultsError)

  """
  def get_employee!(id), do: Repo.get!(Employee, id)

  @doc """
  Creates a employee.

  ## Examples

      iex> create_employee(%{field: value})
      {:ok, %Employee{}}

      iex> create_employee(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_employee(attrs \\ %{}) do
    %Employee{}
    |> Employee.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a employee.

  ## Examples

      iex> update_employee(employee, %{field: new_value})
      {:ok, %Employee{}}

      iex> update_employee(employee, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_employee(%Employee{} = employee, attrs) do
    employee
    |> Employee.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a employee.

  ## Examples

      iex> delete_employee(employee)
      {:ok, %Employee{}}

      iex> delete_employee(employee)
      {:error, %Ecto.Changeset{}}

  """
  def delete_employee(%Employee{} = employee) do
    Repo.delete(employee)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking employee changes.

  ## Examples

      iex> change_employee(employee)
      %Ecto.Changeset{data: %Employee{}}

  """
  def change_employee(%Employee{} = employee, attrs \\ %{}) do
    Employee.changeset(employee, attrs)
  end

  alias MyApp.Account.Gift

  @doc """
  Returns the list of gifts.

  ## Examples

      iex> list_gifts()
      [%Gift{}, ...]

  """
  def list_gifts do
    Repo.all(Gift)
  end

  @doc """
  Gets a single gift.

  Raises `Ecto.NoResultsError` if the Gift does not exist.

  ## Examples

      iex> get_gift!(123)
      %Gift{}

      iex> get_gift!(456)
      ** (Ecto.NoResultsError)

  """
  def get_gift!(id), do: Repo.get!(Gift, id)

  @doc """
  Creates a gift.

  ## Examples

      iex> create_gift(%{field: value})
      {:ok, %Gift{}}

      iex> create_gift(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_gift(attrs \\ %{}) do
    %Gift{}
    |> Gift.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a gift.

  ## Examples

      iex> update_gift(gift, %{field: new_value})
      {:ok, %Gift{}}

      iex> update_gift(gift, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_gift(%Gift{} = gift, attrs) do
    gift
    |> Gift.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a gift.

  ## Examples

      iex> delete_gift(gift)
      {:ok, %Gift{}}

      iex> delete_gift(gift)
      {:error, %Ecto.Changeset{}}

  """
  def delete_gift(%Gift{} = gift) do
    Repo.delete(gift)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking gift changes.

  ## Examples

      iex> change_gift(gift)
      %Ecto.Changeset{data: %Gift{}}

  """
  def change_gift(%Gift{} = gift, attrs \\ %{}) do
    Gift.changeset(gift, attrs)
  end
end
