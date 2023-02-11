# == Schema Information
#
# Table name: stats
#
#  id         :bigint           not null, primary key
#  points     :integer
#  assists    :integer
#  rebounds   :integer
#  steals     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Stat < ApplicationRecord
end
