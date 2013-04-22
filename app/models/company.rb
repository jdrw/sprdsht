# == Schema Information
#
# Table name: companies
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  gmail      :string(255)
#  gpassword  :string(255)
#  drive_id   :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Company < ActiveRecord::Base
  attr_accessible :drive_id, :gmail, :gpassword, :name
end
