Given /the following movies exist/ do |movies_table|
  # A very simple way of doing homework
  # Movie.create!(movies_table.hashes)

  # Or, a way with slightly more work
  movies_table.hashes.each do |movie|
    Movie.create!(movie)
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
  end
  # assert false, "Unimplmemented"
end

Then /^the director of "([^"]*)" should be "([^"]*)"$/ do |title, director|
  movie = Movie.find_by_title(title)
  assert movie.director.should == director
end

