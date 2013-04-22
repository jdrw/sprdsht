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

require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
