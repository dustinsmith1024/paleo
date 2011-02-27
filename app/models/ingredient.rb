class Ingredient < ActiveRecord::Base
  belongs_to :recipe

#  scope :name, lambda {|namer| :conditions => { ['name like ?',namer] } }
#  scope :namer, lambda {|n| :conditions => ['name like ?',n] }
  scope :by_name, lambda {|search| where("name LIKE ?",search)}
#  scope :section, lambda {|section| joins(:question).where("questions.section = ?",section)}
#  scope :stakeholder_interviews, :conditions => "position NOT IN ('Radiologist','Technologist','PACS Admin')" #THIS HAD A modality in ('None','') but i dont think its needed...
#  scope :current, :conditions => "status IN ('Active','Assessing')"
#  scope :not_current, :conditions => "status NOT IN ('Active','Assessing')", :order => "kickoff DESC"
#  scope :baseline, :conditions => "status = 'Baseline'"



end
