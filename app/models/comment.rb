# == Schema Information
#
# Table name: comments
#
#  id           :integer          not null, primary key
#  body         :text
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  commenter_id :integer
#  story_id     :integer
#
class Comment < ApplicationRecord

  # Validations
  validates(:story_id, { :presence => true })
  validates(:commenter_id, { :presence => true })
  validates(:body, { :presence => true })

  # Direct Associations
  belongs_to(:commenter, { :required => true, :class_name => "User", :foreign_key => "commenter_id" })

  belongs_to(:photo, { :required => true, :class_name => "Story", :foreign_key => "story_id", :counter_cache => true })
end
