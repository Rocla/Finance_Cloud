class Article < ActiveRecord::Base
  validates :title,
            presence: true,
            length: {minimum: 3, maximum: 50}

  validates :content,
            presence: true,
            length: {minimum: 10, maximum: 500}
end
