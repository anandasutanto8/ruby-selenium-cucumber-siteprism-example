Given('user is on Wikipedia home page') do
  @wikipedia_home_page = WikipediaHomePage.new
  @wikipedia_home_page.load
end

When('user input for entry {string}') do |string|
  @user_entry = string
  @wikipedia_home_page.fill_search_field(@user_entry)
end

Then('respective entry should be appeared in suggestion dropdown') do
  expect(@wikipedia_home_page.get_suggestion_dropdown_title_by_index(0).downcase).to include(@user_entry.downcase)
end

When('user clicked search button') do
  @wikipedia_home_page.click_search_button
end

Then('related Wikipedia article should be appeared') do
  @wikipedia_article_page = WikipediaArticlePage.new

  expect(@wikipedia_article_page.get_page_article_title.downcase).to eq(@user_entry.downcase)
  expect(@wikipedia_article_page.get_page_article_content.downcase).to include(@user_entry.downcase)

  # save screenshot with epoch time as filename & with .png file type
  save_screenshot(Time.now.to_i.to_s + '.png')
end

And('biography image should be appeared') do
  expect(@wikipedia_article_page.get_biography_image_http_status_message).to eq(200)
end
