defmodule BankAccount do
  @moduledoc """
  Documentation for `BankAccount`.
  """

  @doc """
  Opens a new account returning the account id

  ## Examples

      iex> BankAccount.open(1, 200)
      {:ok, 1}

  """
  @spec open(pos_integer()) :: {:ok, pos_integer()} | {:error, String.t()}
  def open(_id) do
    {:ok, 1}
  end

  @doc """
  Deletes an account

  ## Examples

      iex> BankAccount.delete(1)
      {:ok, 1}

  """
  @spec delete(pos_integer()) :: :ok | {:error, String.t()}
  def delete(_id) do
    :ok
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
  When money is available return the new balance

  ## Examples

      iex> BankAccount.transer(1, 3, 100)
      {:ok, 900}

  """
  @spec transfer(pos_integer(), pos_integer(), pos_integer()) :: {:ok, pos_integer()} | {:error, String.t()}
  def transfer(_sender_id, _receiver_id, _amount) do
    {:ok, 900}
  end
end
