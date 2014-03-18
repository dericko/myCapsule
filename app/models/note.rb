class Note < ActiveRecord::Base
  belongs_to :user
  validates :body, length: {within: 0..500}
  validates :title, uniqueness: true
  validates :timer, numericality: {greater_than: 0}
end