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
    render_list do |li|
      li << link_to(product_type_chinese('effect'), product_type_path('effect'),:class=>'nav-link')
      li << link_to(product_type_chinese('project'), product_type_path('project'),:class=>'nav-link')
      li << link_to(product_type_chinese('smoke'), product_type_path('smoke'),:class=>'nav-link' )
      li << link_to(product_type_chinese('gadge'), product_type_path('gadge'),:class=>'nav-link')
      li << link_to(product_type_chinese('mech'), product_type_path('mech'),:class=>'nav-link')
      li << link_to(product_type_chinese('special'), product_type_path('special'),:class=>'nav-link')
      li << link_to(product_type_chinese('firework'), product_type_path('firework'),:class=>'nav-link')
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
    def youtube_embed(youtube_url)
    if youtube_url[/youtu\.be\/([^\?]*)/]
      youtube_id = $1
    else
      # Regex from # http://stackoverflow.com/questions/3452546/javascript-regex-how-to-get-youtube-video-id-from-url/4811367#4811367
      youtube_url[/^.*((v\/)|(embed\/)|(watch\?))\??v?=?([^\&\?]*).*/]
      youtube_id = $5
    end
    %Q{<iframe title="YouTube video player" width="600" height="390" src="http://www.youtube.com/embed/#{ youtube_id }" frameborder="0" allowfullscreen></iframe>}.html_safe
  end
  def youtube_thumbnail(youtube_url)
    if youtube_url[/youtu\.be\/([^\?]*)/]
      youtube_id = $1
    else
      # Regex from # http://stackoverflow.com/questions/3452546/javascript-regex-how-to-get-youtube-video-id-from-url/4811367#4811367
      youtube_url[/^.*((v\/)|(embed\/)|(watch\?))\??v?=?([^\&\?]*).*/]
      youtube_id = $5
    end
    %Q{<img src="http://img.youtube.com/vi/#{ youtube_id }/0.jpg" class="img-thumbnail">}.html_safe
  end
end
