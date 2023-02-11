# == Schema Information
#
# Table name: players
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  age        :integer          not null
#  height     :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Player < ApplicationRecord
end
