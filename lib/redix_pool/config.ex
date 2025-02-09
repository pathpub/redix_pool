defmodule RedixPool.Config do
  defmacro __using__(_) do
    quote do
      @pool_name :redix_pool
      @size Application.compile_env(:redix_pool, :pool_size, 10)
      @max_overflow Application.compile_env(:redix_pool, :pool_max_overflow, 1)
      @timeout Application.compile_env(:redix_pool, :timeout, 5000)
      @redis_url Application.compile_env(:redix_pool, :redis_url, "redis://localhost:6379")
    end
  end
end
