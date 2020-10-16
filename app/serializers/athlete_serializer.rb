class AthleteSerializer < ActiveModel::Serializer
  has_one :user

  attributes :id, :image, :full_name, :phone_number, :address, :height, :weight, :birthday, :positions, :high_school, :graduation_year, :gpa, :user_id
end
