class Basket < ActiveRecord::Base
  belongs_to :user
  has_many :items
  self.inheritance_column = :category
  def self.categories 
    %w(Grocery Restaurant General)
  end

  #scopes
  def self.grocery
    where(category: 'Grocery')
  end

  def self.restaurant
    where(category: 'Restaurant')
  end

  def self.general
    where(category: 'General')
  end

end
