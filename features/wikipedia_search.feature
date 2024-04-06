Feature: Article search on Wikipedia

  @wikipedia
  Scenario: Search a scientist biography article from Wikipedia homepage
    User should be able to get respective article using example data below

    Given user is on Wikipedia home page
    When user input for entry "<Entry>"
    Then respective entry should be appeared in suggestion dropdown
    When user clicked search button
    Then related Wikipedia article should be appeared
    And biography image should be appeared
    Examples:
      | Entry           |
      | Isaac Newton    |
      | Marie Curie     |
      | Nikola Tesla    |
      | Heinrich Hertz  |
      | Tim Berners-Lee |
