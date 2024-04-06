class WikipediaArticlePage < SitePrism::Page
  element   :page_article_title,    ".mw-page-title-main"
  element   :page_article_content,  "div.mw-content-ltr.mw-parser-output"
  element   :biography_image,       ".infobox-image > span > a > img"

  def get_page_article_title
    page_article_title.text
  end

  def get_page_article_content
    page_article_content.text
  end

  def get_biography_image_http_status_message
    Net::HTTP.get_response(URI.parse(biography_image['src'])).code.to_i
  end
end
