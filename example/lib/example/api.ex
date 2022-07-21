defmodule Example.API do
  import Plug.Conn

  def init(opts), do: opts

  def call(conn, _opts) do
    html = ~s"""
    <html>
      <head>
        <title>Kiosk</title>
      </head>
      <body style="display: flex; align-items: center; justify-content: center;">
        <h1>Hello!</h1>
      </body>
    </html>
    """

    conn
    |> put_resp_content_type("text/html")
    |> send_resp(200, html)
  end
end
