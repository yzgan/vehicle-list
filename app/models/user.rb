# frozen_string_literal: true

# app/models/user.rb
class User < ApplicationRecord
  has_many :vehicles, dependent: :destroy
end
