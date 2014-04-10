module FireworksHelper
  def product_type_chinese(type)
    case type
    when 'effect'
      '煙火特效類'
    when 'project'
      '鋼瓶發射性特效'
    when 'smoke'
      '煙霧類特效'
    when 'gadge'
      '道具類特效'
    when 'mech'
      '機械式特效'
    when 'special'
      '特殊效果'
    when 'firework'
      '煙火類'
    else
      'error'
    end
  end

  def product_type_path(type)
    "#{fireworks_path}/type/#{type}"
  end

  def products_navs
    render_list :class => "nav nav-tabs" do |li|
    	li << link_to('ALL', fireworks_path)
      li << link_to(product_type_chinese('effect'), product_type_path('effect'))
      li << link_to(product_type_chinese('project'), product_type_path('project') )
      li << link_to(product_type_chinese('smoke'), product_type_path('smoke') )
      li << link_to(product_type_chinese('gadge'), product_type_path('gadge'))
      li << link_to(product_type_chinese('mech'), product_type_path('mech'))
      li << link_to(product_type_chinese('special'), product_type_path('special'))
      li << link_to(product_type_chinese('firework'), product_type_path('firework'))
    end
    # content_tag(:ul,:class => 'nav nav-tabs') do
    # 	s = ""
    #   s+=content_tag(:li, product_type_path('effect'))
    #   s+=content_tag(:li, product_type_path('project'))
    #   s+=content_tag(:li, product_type_path('smoke'))
    #   s+=content_tag(:li, product_type_path('gadge'))
    #   s+=content_tag(:li, product_type_path('mech'))
    #   s+=content_tag(:li, product_type_path('special'))
    #   s+=content_tag(:li, product_type_path('firework'))
    #   s.html_safe
    # end
    # html = ""
    # html+=product_type_path('effect')
    # html+=product_type_path('project')
    # html+=product_type_path('smoke')
    # html+=product_type_path('gadge')
    # html+=product_type_path('mech')
    # html+=product_type_path('special')
    # html+=product_type_path('firework')
    # html.html_safe

  end
end
