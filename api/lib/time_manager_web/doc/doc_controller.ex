defmodule TimeManagerWeb.DocController do
  use TimeManagerWeb, :controller

  def show(conn, _params) do
    send_resp(conn, 200, File.read!("priv/static/index.html"))
  end
end
