defmodule BankAccount do
  @moduledoc """
  Documentation for `BankAccount`.
  """

  @doc """
  Opens a new account returning the account id

  ## Examples

      iex> BankAccount.open()
      {:ok, 1}

  """
  @spec open() :: {:ok, pos_integer()} | {:error, String.t()}
  def open() do
    {:ok, 1}
  end

  @doc """
  Deletes an account returning id and remaining balance

  ## Examples

      iex> BankAccount.delete(1)
      {:ok, 1, 1000}

  """
  @spec delete(pos_integer()) :: :ok | {:error, String.t()}
  def delete(_id) do
    :ok
  end

  @doc """
  Get balance for an account

  ## Examples

      iex> BankAccount.balance()
      {:ok, 1000}

  """
  @spec balance(pos_integer()) :: {:ok, pos_integer()} | {:error, String.t()}
  def balance(_id) do
    {:ok, 1000}
  end

  @doc """
  Withdraw money from an account. Return the new balance

  ## Examples

      iex> BankAccount.withdraw(1, 200)
      {:ok, 800}

  """
  @spec withdraw(pos_integer(), pos_integer()) :: {:ok, pos_integer()} | {:error, String.t()}
  def withdraw(_id, _amount) do
    {:ok, 800}
  end

  @doc """
  Deposit money into an account. Return the new balance

  ## Examples

      iex> BankAccount.deposit(1, 100)
      {:ok, 1100}

  """
  @spec deposit(pos_integer(), pos_integer()) :: {:ok, pos_integer()} | {:error, String.t()}
  def deposit(_id, _amount) do
    {:ok, 1100}
  end

  @doc """
  Transfer money from one account to another.
  When money is available return the new balances(sender, receiver)
  It is allowed to transfer money to yourself

  ## Examples

      iex> BankAccount.transfer(1, 3, 100)
      {:ok, 900, 100}

  """
  @spec transfer(pos_integer(), pos_integer(), pos_integer()) ::
          {:ok, pos_integer(), pos_integer()} | {:error, String.t()}
  def transfer(_sender_id, _receiver_id, _amount) do
    {:ok, 900}
  end

  @doc """
  OPTIONAL: Retrieve the history of transactions for the account

  ## Examples

      iex> BankAccount.history(1)
      {:ok, []}

  """
  @spec history(pos_integer()) :: {:ok, list(any)} | {:error, String.t()}
  def history(_id) do
    []
  end
end
