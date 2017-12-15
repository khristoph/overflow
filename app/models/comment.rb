class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :commentable, polymorphic: true
  has_many :votes, as: :votable


  def points
    votes.sum(:value)
  end

end
