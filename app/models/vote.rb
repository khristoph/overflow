class Vote < ApplicationRecord

validates_uniqueness_of :user_id, :scope => [:votable_id, :votable_type]
belongs_to :votable, polymorphic: true
end
