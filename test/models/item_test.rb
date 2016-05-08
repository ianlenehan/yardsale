# == Schema Information
#
# Table name: items
#
#  id          :integer          not null, primary key
#  name        :string
#  description :string
#  image       :text
#  price       :integer
#  negotiable  :boolean          default("false")
#  charity     :boolean          default("false")
#  closed      :date
#  flags       :integer          default("0")
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class ItemTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
