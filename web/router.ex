defmodule Discuss.Router do
  use Discuss.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Discuss do
    pipe_through :browser

    get "/", TopicController, :index
  end

  scope "/topics", Discuss do
    pipe_through :browser

    get "/new", TopicController, :new
    post "/", TopicController, :create
    get "/:id/edit", TopicController, :edit
    put "/:id", TopicController, :update
    delete "/:id", TopicController, :delete
  end

  scope "/auth", Discuss do
    pipe_through :browser

    get "/:provider", AuthController, :request
    get "/:provider/callback", AuthController, :callback
  end
end
