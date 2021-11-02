defmodule BankAccountCorrectnessTest do
  use ExUnit.Case

  test "open delete relationship" do
    {:ok, id} = BankAccount.open()
    assert {:ok, ^id, 0} = BankAccount.delete(id)
  end

  test "Withdraw deposit" do
    {:ok, id} = BankAccount.open()
    assert {:ok, 300} = BankAccount.deposit(id, 300)
    assert {:ok, 100} = BankAccount.withdraw(id, 200)
    assert {:error, _} = BankAccount.withdraw(id, 300)
    assert {:ok, ^id, 100} = BankAccount.delete(id)
  end

  test "negative is not allowed" do
    {:ok, id} = BankAccount.open()
    assert {:ok, 300} = BankAccount.deposit(id, 300)
    assert {:error, _} = BankAccount.deposit(id, -300)
    assert {:error, _} = BankAccount.withdraw(id, -200)

    {:ok, id2} = BankAccount.open()
    assert {:error, _} = BankAccount.transfer(id, id2, -200)

    assert {:ok, ^id, 300} = BankAccount.delete(id)
    assert {:ok, ^id2, 0} = BankAccount.delete(id2)
  end

  test "transfer money" do
    {:ok, id} = BankAccount.open()
    assert {:ok, 300} = BankAccount.deposit(id, 300)

    {:ok, id2} = BankAccount.open()
    assert {:ok, 500} = BankAccount.deposit(id2, 500)
    assert {:ok, 100, 700} = BankAccount.transfer(id, id2, 200)

    assert {:ok, ^id, 100} = BankAccount.delete(id)
    assert {:ok, ^id2, 700} = BankAccount.delete(id2)
  end

  test "check balance" do
    {:ok, id} = BankAccount.open()
    assert {:ok, 0} = BankAccount.balance(id)
    assert {:ok, 300} = BankAccount.deposit(id, 300)
    assert {:ok, 300} = BankAccount.balance(id)
    assert {:ok, ^id, 300} = BankAccount.delete(id)
  end

end
