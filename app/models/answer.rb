class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :question
  has_many :comments, as: :commentable
  has_many :votes, as: :votable


  def points
    votes.sum(:value)
  end
  
end
