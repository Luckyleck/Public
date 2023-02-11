# == Schema Information
#
# Table name: sponsorships
#
#  id         :bigint           not null, primary key
#  name       :string
#  player_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Sponsorship < ApplicationRecord
end
