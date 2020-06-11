module ApplicationHelper
  def full_title(page_title = '')
    base_title = 'idol places'
    if page_title.empty?
      base_title
    else
      page_title + ' | ' + base_title
    end
  end

  def get_twitter_card_info(page_title)
    twitter_card = {}
    if page_title
      twitter_card[:url] = request.url
      twitter_card[:description] = page_title
    else
      twitter_card[:url] = 'https://idolplaces.site/'
      twitter_card[:description] = 'アイドル現場の情報共有&イベント写真投稿プラットフォーム'
    end
    twitter_card[:card] = 'summary'
    twitter_card[:site] = '@IdolPlaces'
    twitter_card[:title] = 'idol places-アイドル現場情報共有サイト-'
    twitter_card[:image] = 'https://user-images.githubusercontent.com/59955191/84363727-1af2ed80-ac0a-11ea-8a3f-27d08e4ccd45.png'
    twitter_card
  end
end
