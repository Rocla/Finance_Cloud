class Article < ActiveRecord::Base
  belongs_to :user

  validates :title,
            presence: true,
            length: {minimum: 3, maximum: 50}

  validates :content,
            presence: true,
            length: {minimum: 10, maximum: 500}

  validates :user_id, presence: true

  #@nb_per_page = 2
  #paginates_per @nb_per_page
  #total_pages = (Article.count/@nb_per_page).ceil

end
