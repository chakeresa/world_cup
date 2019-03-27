require 'minitest/autorun'
require 'minitest/pride'
require './lib/team'

class TeamTest < Minitest::Test
  def test_it_exists
    team = Team.new("France")

    assert_instance_of Team, team
  end

  def test_it_inits_with_country
    team = Team.new("France")

    assert_equal "France", team.country
  end

  def test_it_inits_with_eliminated_false
    team = Team.new("France")

    assert_equal false, team.eliminated?
  end

  def test_it_can_be_eliminated
    team = Team.new("France")

    team.eliminated = true

    assert_equal true, team.eliminated?
  end

  def test_it_starts_with_an_empty_ary_of_players
    team = Team.new("France")

    assert_equal [], team.players
  end

  def test_it_adds_players
    team = Team.new("France")
    mbappe = Player.new({name: "Kylian Mbappe", position: "forward"})
    pogba = Player.new({name: "Paul Pogba", position: "midfielder"})

    team.add_player(mbappe)
    team.add_player(pogba)

    assert_equal [mbappe, pogba], team.players
  end
end
