require_relative '../setup'
require_relative './exercise_1'
require_relative './exercise_2'
require_relative './exercise_3'
require_relative './exercise_4'
require_relative './exercise_5'
require_relative './exercise_6'

puts "Exercise 7"
puts "----------"

# Your code goes here ...

class Employee < ActiveRecord::Base
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :hourly_rate, numericality: { only_integer: true }
  validates_inclusion_of :hourly_rate, :in => 40..200
  validates_associated :store
end

class Store < ActiveRecord::Base
  validates_length_of :name, minimum: 3
  validates :annual_revenue, numericality: { only_integer: true }
  validates_numericality_of :annual_revenue, greater_than_or_equal_to: 0
  validate :must_cary_mens_or_womens_apparel

  def must_cary_mens_or_womens_apparel
    if mens_apparel == false && womens_apparel == false
      errors.add(:mens_apparel, :womens_apparel, "Store must carry mens or womens apparel!")
    end
  end
end

errors = Store.create(name: "Surrey").errors.full_messages
puts "Errors: #{errors.count}"
errors.each do |err|
  puts "Error: #{err}"
end 