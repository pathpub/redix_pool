defmodule RedixPool.Worker do
  use GenServer
  use RedixPool.Config

  ## Client API

  def start_link(_a) do
    GenServer.start_link(__MODULE__, %{conn: nil}, [])
  end

  ## Server API

  def init(state) do
    {:ok, state}
  end

  @doc false
  def handle_call({command, args, opts}, _from, %{conn: nil}) do
    conn = connect()
    {:reply, apply(Redix, command, [conn, args, opts]), %{conn: conn}}
  end

  @doc false
  def handle_call({command, args, opts}, _from, %{conn: conn}) do
    {:reply, apply(Redix, command, [conn, args, opts]), %{conn: conn}}
  end

  defp connect do
    {:ok, conn} =
      Redix.start_link(host: @host, port: @port, password: @password)

    conn
  end
end
