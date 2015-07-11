class Basket < ActiveRecord::Base
  belongs_to :user
  self.inheritance_column = :type

  def self.types 
    %w(Grocery Restaurant General)
  end

  #scopes
  def self.grocery
    where(type: 'Grocery')
  end

  def self.restaurant
    where(type: 'Restaurant')
  end

  def self.general
    where(type: 'General')
  end

end
