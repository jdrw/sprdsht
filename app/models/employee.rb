# == Schema Information
#
# Table name: employees
#
#  id         :integer          not null, primary key
#  username   :string(255)
#  name       :string(255)
#  company_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Employee < ActiveRecord::Base
  attr_accessible :company_id, :name, :username
end
