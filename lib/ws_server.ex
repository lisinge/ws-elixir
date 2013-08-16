defmodule WebSocketServer do
  @behaviour :application

  def start(_type, _args) do
    dispatch = :cowboy_router.compile([
      {:_, [
        {'/ws',  FileHandler, []},
        {'/_ws', WebSocketHandler, [{:dumb_protocol,   DumbIncrementHandler},
                                    {:mirror_protocol, MirrorHandler}]},
        {'/',    HelloHandler, []}
      ]}
    ])
    port = binary_to_integer(System.get_env("PORT")) || 8080
    :cowboy.start_http :my_http_listener, 100, [{:port, port}], [{:env, [{:dispatch, dispatch}]}]
    IO.puts "Started listening on port #{port}..."

    WebSocketSup.start_link
  end

  def stop(_state) do
    :ok
  end
end
