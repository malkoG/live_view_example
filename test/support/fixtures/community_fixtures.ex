defmodule LiveViewExample.CommunityFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `LiveViewExample.Community` context.
  """

  @doc """
  Generate a feed.
  """
  def feed_fixture(attrs \\ %{}) do
    {:ok, feed} =
      attrs
      |> Enum.into(%{
        content: "some content",
        title: "some title"
      })
      |> LiveViewExample.Community.create_feed()

    feed
  end
end
