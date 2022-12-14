# == Schema Information
#
# Table name: likes
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  story_id   :integer
#  user_id    :integer
#
class Like < ApplicationRecord

  # Validations
  validates(:user_id, { :presence => true })
  validates(:story_id, { :presence => true })

  validates(:story_id, { :uniqueness => { :scope => ["user_id"], :message => "already liked" } })

  # Direct Associations
  belongs_to(:user, { :required => true, :class_name => "User", :foreign_key => "user_id" })

  belongs_to(:photo, { :required => true, :class_name => "Story", :foreign_key => "story_id", :counter_cache => true })
end
