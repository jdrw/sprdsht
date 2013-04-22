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

class SpreadsheetComment < ActiveRecord::Base
  attr_accessible :commented_on, :content, :employee_id, :username

  validates :username, :content, :employee_id, presence: true
end
