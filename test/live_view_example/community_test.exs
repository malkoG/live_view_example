defmodule LiveViewExample.CommunityTest do
  use LiveViewExample.DataCase

  alias LiveViewExample.Community

  describe "feeds" do
    alias LiveViewExample.Community.Feed

    import LiveViewExample.CommunityFixtures

    @invalid_attrs %{content: nil, title: nil}

    test "list_feeds/0 returns all feeds" do
      feed = feed_fixture()
      assert Community.list_feeds() == [feed]
    end

    test "get_feed!/1 returns the feed with given id" do
      feed = feed_fixture()
      assert Community.get_feed!(feed.id) == feed
    end

    test "create_feed/1 with valid data creates a feed" do
      valid_attrs = %{content: "some content", title: "some title"}

      assert {:ok, %Feed{} = feed} = Community.create_feed(valid_attrs)
      assert feed.content == "some content"
      assert feed.title == "some title"
    end

    test "create_feed/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Community.create_feed(@invalid_attrs)
    end

    test "update_feed/2 with valid data updates the feed" do
      feed = feed_fixture()
      update_attrs = %{content: "some updated content", title: "some updated title"}

      assert {:ok, %Feed{} = feed} = Community.update_feed(feed, update_attrs)
      assert feed.content == "some updated content"
      assert feed.title == "some updated title"
    end

    test "update_feed/2 with invalid data returns error changeset" do
      feed = feed_fixture()
      assert {:error, %Ecto.Changeset{}} = Community.update_feed(feed, @invalid_attrs)
      assert feed == Community.get_feed!(feed.id)
    end

    test "delete_feed/1 deletes the feed" do
      feed = feed_fixture()
      assert {:ok, %Feed{}} = Community.delete_feed(feed)
      assert_raise Ecto.NoResultsError, fn -> Community.get_feed!(feed.id) end
    end

    test "change_feed/1 returns a feed changeset" do
      feed = feed_fixture()
      assert %Ecto.Changeset{} = Community.change_feed(feed)
    end
  end
end
