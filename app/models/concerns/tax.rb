module Tax
  TAX_PER = 0.08.freeze

  def calculate_tax(total)
    (total * TAX_PER).to_i
  end
end
