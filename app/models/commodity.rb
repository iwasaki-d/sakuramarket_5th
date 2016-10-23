class Commodity < ActiveRecord::Base
  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :position, presence: true
  validates :view_enabled, inclusion: {in: [true, false]}

  default_value_for :position, 0
  default_value_for :price, 0
  default_value_for :view_enabled, false

  scope :active_commodities, -> { where(view_enabled: true).order(:position)}

end

