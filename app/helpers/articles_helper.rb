module ArticlesHelper
  def truncated_button(article)
    if article.body.length > Article::TRUNCATION_LENGTH
      link_to('Read More', article_path(article), class: 'btn btn-primary')
    else
      nil
    end
  end
end
