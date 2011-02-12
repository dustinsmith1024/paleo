Given /^the following recipes:$/ do |recipes|
  Recipe.create!(recipes.hashes)
end

When /^I delete the (\d+)(?:st|nd|rd|th) recipe$/ do |pos|
  visit recipes_path
  within("table tr:nth-child(#{pos.to_i+1})") do
    click_link "Destroy"
  end
end

Then /^I should see the following recipes:$/ do |expected_recipes_table|
  expected_recipes_table.diff!(tableish('table tr', 'td,th'))
end
