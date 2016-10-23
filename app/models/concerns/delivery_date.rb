require 'date'

module DeliveryDate

  SELECTABLE_MIN_DAY_COUNT = 3.freeze
  SELECTABLE_MAX_DAY_COUNT = 14.freeze

  CREATE_WORKING_DAY_COUNT = 20.freeze

  def selectable_delivery_dates
    selectable_delivery_dates = (SELECTABLE_MIN_DAY_COUNT..CREATE_WORKING_DAY_COUNT).collect{|day_count| Date.today + day_count.days}
    selectable_delivery_dates.select!{|day| [1, 2, 3, 4, 5].include?(day.wday)}
    selectable_delivery_dates[0...SELECTABLE_MAX_DAY_COUNT]
  end
end
