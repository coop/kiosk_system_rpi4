defmodule Example.Application do
  use Application

  @xdg_runtime_dir "/tmp/nerves_weston"

  @impl true
  def start(_type, _args) do
    children = [
      {Plug.Cowboy, scheme: :http, plug: Example.API, options: [port: 4000]},
      {NervesWeston, tty: 1, xdg_runtime_dir: @xdg_runtime_dir, name: :weston},
      {NervesCog,
       url: "http://localhost:4000",
       fullscreen: true,
       xdg_runtime_dir: @xdg_runtime_dir,
       wayland_display: "wayland-1",
       name: :cog}
    ]

    opts = [strategy: :rest_for_one, name: Example.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
