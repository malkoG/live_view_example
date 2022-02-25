defmodule LiveViewExample.Community.Feed do
  use Ecto.Schema
  import Ecto.Changeset

  schema "feeds" do
    field :content, :string
    field :title, :string

    timestamps()
  end

  @doc false
  def changeset(feed, attrs) do
    feed
    |> cast(attrs, [:title, :content])
    |> validate_required([:title, :content])
  end
end
