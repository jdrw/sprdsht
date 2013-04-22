# == Schema Information
#
# Table name: spreadsheet_comments
#
#  id           :integer          not null, primary key
#  employee_id  :integer
#  username     :string(255)
#  content      :text
#  commented_on :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require 'test_helper'

class SpreadsheetCommentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
