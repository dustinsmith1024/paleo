class Recipe < ActiveRecord::Base
  has_many :ingredients
  scope :by_ingredient, lambda {|search| joins(:ingredients).where("ingredients.name like ?",search)}
#  scope :by_ingredient, lambda {|search| joins(:ingredients).where("ingredients.name like ?","%#{search}%")}

  accepts_nested_attributes_for :ingredients, :reject_if => lambda { |a| a[:amount].blank? }, :allow_destroy => true
end
