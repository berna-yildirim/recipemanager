require 'test_helper'

class RecipeTest < ActiveSupport::TestCase

  def setup
    @chef = Chef.create(chefname: "bob", email: "bob@example.com")
    @recipe = @chef.recipes.build(name: "chicken parm", summary: "best chicken parm ever", description: "Your sauce will only be as good as your tomatoes, so use a good quality canned tomato!")
  end

  test "recipe should be valid" do
    assert @recipe.valid?
  end

  test "chef_id should be present" do
    @recipe.chef_id = nil
    assert_not @recipe.valid?
  end

  test "name must be present" do
    @recipe.name = " "
    assert_not @recipe.valid?
  end

  test "name length should be maximum 100 characters" do
    @recipe.name = "a" * 101
    assert_not @recipe.valid?
  end

  test "name length should be minimum 5 characters" do
    @recipe.name = "aaaa"
    assert_not @recipe.valid?
  end

  test "summary must be present" do
    @recipe.summary = " "
    assert_not @recipe.valid?
  end

  test "summary length should be macimum 150 characters" do
    @recipe.summary = "a" * 151
    assert_not @recipe.valid?
  end

  test "summary length should be minimum 10 characters" do
    @recipe.summary = "a" * 9
    assert_not @recipe.valid?
  end

  test "description must be present" do
   @recipe.description = " "
    assert_not @recipe.valid?
  end

  test "description length should be maximum 1500 characters" do
    @recipe.description = "a" * 1501
    assert_not @recipe.valid?
  end

  test "description length should be minimum 20 characters" do
    @recipe.description = "a" * 19
    assert_not @recipe.valid?
  end


end