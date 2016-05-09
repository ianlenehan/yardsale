# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name_first      :string
#  name_last       :string
#  email           :string
#  password_digest :string
#  photo           :string           default("/assets/default.jpg")
#  admin           :boolean
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ActiveRecord::Base
  has_many :comments
  has_many :favourites
  has_many :items
end
