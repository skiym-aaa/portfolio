class SearchController < ApplicationController
  def search
    @model = params['search']['model']
    @content = params['search']['content']
    @method = params['search']['method']
    @records = search_for(@model, @content, @method)
  end

  private

  def search_for(model, content, method)
    if model == 'idol'
      if method == 'perfect'
        Idol.where(name: content)
      elsif method == 'forward'
        Idol.where('name LIKE ?', content + '%')
      elsif method == 'backward'
        Idol.where('name LIKE ?', '%' + content)
      else
        Idol.where('name LIKE ?', '%' + content + '%')
      end
    elsif model == 'place'
      if method == 'perfect'
        Place.where(name: content)
      elsif method == 'forward'
        Place.where('name LIKE ?', content + '%')
      elsif method == 'backward'
        Place.where('name LIKE ?', '%' + content)
      else
        Place.where('name LIKE ?', '%' + content + '%')
      end
    else model == 'event'
         if method == 'perfect'
           Event.where(title: content)
         elsif method == 'forward'
           Event.where('title LIKE ?', content + '%')
         elsif method == 'backward'
           Event.where('title LIKE ?', '%' + content)
         else
           Event.where('title LIKE ?', '%' + content + '%')
         end
    end
  end
end
