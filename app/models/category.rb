class Category < ActiveRecord::Base

  has_many :category
  belongs_to :category

end
