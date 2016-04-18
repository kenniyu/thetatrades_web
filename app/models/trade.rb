class Trade < ActiveRecord::Base
  belongs_to :ticker
  belongs_to :user
  
  has_many :comments, as: :commentable
end
