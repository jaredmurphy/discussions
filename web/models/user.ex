defmodule Discuss.User do
  use Discuss.Web, :model

  schema "users" do
    field :login, :string
    field :provider, :string
    field :token, :string
    has_many :topics, Discuss.Topic
    
    timestamps()
  end
   
  def changeset(struct, params  \\ %{}) do
    struct
    |> cast(params, [:login, :provider, :token])
    |> validate_required([:login, :provider, :token])
  end
end
