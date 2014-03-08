# == Schema Information
#
# Table name: groups
#
#  id               :integer          not null, primary key
#  wod_prototype_id :integer
#  wod_id           :integer
#  name             :string(255)
#  position         :integer
#  created_at       :datetime
#  updated_at       :datetime
#

class Group < ActiveRecord::Base
	belongs_to :wod_prototype
	validates :wod_prototype_id, presence: true
	has_many :setts
end
