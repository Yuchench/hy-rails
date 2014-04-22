module ApplicationHelper
  def firework_serial(firework)
    type = Firework.type_codes[firework.product_type].to_s
    sub = Firework.sub_type_codes[firework.sub_type].to_s
    if sub != ""
      "#{type}-#{sub}-#{firework.code}"
    else
      "#{type}-#{firework.code}"
    end
  end
end
