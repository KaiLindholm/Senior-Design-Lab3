class Comment < ActiveRecord::Base
  belongs_to :user
  validates :content, presence: true, length: { minimum: 2, maximum: 140 }
  validates :page, presence: true
  
  def page
    self[:page]
  end
end

