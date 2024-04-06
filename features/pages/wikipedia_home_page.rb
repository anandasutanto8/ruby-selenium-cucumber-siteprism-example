class WikipediaHomePage < SitePrism::Page
  set_url "https://www.wikipedia.org/"

  element   :search_field,                "#searchInput"
  element   :search_button,               "#search-form > fieldset > button"
  elements  :suggestion_dropdown_titles,  "h3.suggestion-title"

  def fill_search_field(entry)
    wait_until_search_field_visible
    search_field.set entry
  end

  def get_suggestion_dropdown_title_by_index(index)
    wait_until_suggestion_dropdown_titles_visible
    suggestion_dropdown_titles[index].text
  end

  def click_search_button
    wait_until_search_button_visible
    search_button.click
  end
end
