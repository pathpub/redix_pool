defmodule RedixPool.Config do
  defmacro __using__(_) do
    quote do
      # Pool options
      @pool_name :redix_pool
      @size Application.compile_env(:redix_pool, :pool_size, 5)
      @max_overflow Application.compile_env(:redix_pool, :pool_max_overflow, 1)
      @timeout Application.compile_env(:redix_pool, :timeout, 5000)

      # Redix options
      @host Application.compile_env(:redix_pool, :host, "localhost")
      @port Application.compile_env(:redix_pool, :port, 6379)
      @password Application.compile_env(
                  :redix_pool,
                  :password,
                  nil
                )
    end
  end
end
