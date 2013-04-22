# == Schema Information
#
# Table name: comments
#
#  id               :integer          not null, primary key
#  discussable_id   :integer
#  discussable_type :string(255)
#  content          :text
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  username         :string(255)
#

class Comment < ActiveRecord::Base
  belongs_to :discussable
  attr_accessible :content
end
