defmodule TimeManagerWeb.ErrorView do
  use TimeManagerWeb, :view

  # If you want to customize a particular status code
  # for a certain format, you may uncomment below.
  def render("401.json", %{message: message}) do
    %{error: %{code: "401", message: message}}
  end

  # By default, Phoenix returns the status message from
  # the template name. For example, "404.json" becomes
  # "Not Found".
  def template_not_found(template, _assigns) do
    %{errors: %{detail: Phoenix.Controller.status_message_from_template(template)}}
  end
end
