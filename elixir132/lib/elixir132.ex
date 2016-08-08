defmodule Elixir132.Api do
  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    children = [
      worker(Elixir132.Web, [])
    ]

    opts = [strategy: :one_for_one, name: Elixir132.Supervisor]
    Supervisor.start_link(children, opts)
  end
end

defmodule Elixir132.Web do
  use Plug.Router

  plug :match
  plug :dispatch

  def init(options) do
    options
  end

  def start_link do
    {:ok, _} = Plug.Adapters.Cowboy.http Elixir132.Web, []
  end

  get "/" do
    conn
    |> send_resp(200, "ok")
    |> halt
  end

  match _ do
    conn
    |> send_resp(404, "Nothing here")
    |> halt
  end
end
