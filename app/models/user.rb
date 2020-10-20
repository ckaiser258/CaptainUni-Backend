class User < ApplicationRecord
    has_secure_password

    has_many :athletes

    validates :first_name, :last_name, :username, :password, presence: { message: "must be given" }
    validates :username, uniqueness: { message: "is taken" }
end
