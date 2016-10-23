module DeliveryTime

  SELECTABLE_TIME_1 = '8-12'.freeze
  SELECTABLE_TIME_2 = '12-14'.freeze
  SELECTABLE_TIME_3 = '14-16'.freeze
  SELECTABLE_TIME_4 = '16-18'.freeze
  SELECTABLE_TIME_5 = '18-20'.freeze
  SELECTABLE_TIME_6 = '20-21'.freeze

  def selectable_delivery_times
    [SELECTABLE_TIME_1, SELECTABLE_TIME_2, SELECTABLE_TIME_3,
     SELECTABLE_TIME_4, SELECTABLE_TIME_5, SELECTABLE_TIME_6]
  end
end