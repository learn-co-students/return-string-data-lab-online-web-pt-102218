class Product < ActiveRecord::Base
  has_many :ordered_products
  has_many :orders, :through => :ordered_products

  attr_accessor :description, :inventory

  def in_stock?
    self.inventory > 0
  end
  
end
