defmodule BankAccountBenchmarkTest do
  use ExUnit.Case

  @num_accounts 10_000
  @runtime_per_test 2

  @tag timeout: :infinity
  test "benchmarks" do
    accounts =
      Enum.reduce(0..@num_accounts, %{}, fn id, acc ->
        {:ok, account_id} = BankAccount.open()
        Map.put(acc, id, account_id)
      end)

    Benchee.run(
      %{
        "read test" => fn -> BankAccount.balance(:rand.uniform(@num_accounts)) end
      },
      time: @runtime_per_test
    )

    Benchee.run(
      %{
        "deposit test" => fn ->
          account_id = Map.get(accounts, :rand.uniform(@num_accounts))
          BankAccount.deposit(account_id, 1)
        end
      },
      time: @runtime_per_test
    )

    Benchee.run(
      %{
        "transfer test" => fn ->
          receiver_id = Map.get(accounts, :rand.uniform(@num_accounts))
          sender_id = Map.get(accounts, :rand.uniform(@num_accounts))
          BankAccount.transfer(receiver_id, sender_id, 1)
        end
      },
      time: @runtime_per_test
    )
  end
end
