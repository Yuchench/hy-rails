# # ["舞台煙火","stage"],
#  ["升空煙火","air"],
#   ["特殊煙火","special"],
#   ["鋼瓶發射類","project"],
#   ["道具類","gadge"],
#   ["機械式","mech"]]) %>
module FireworksHelper
  def product_type_chinese(type)
    case type
    when 'stage'
      '舞台煙火'
    when 'air'
      '升空煙火'
    when 'special'
      '特殊煙火'
    when 'project'
      '鋼瓶發射類'
    when 'gadge'
      '道具類'
    when 'mech'
      '機械式'
    else
      '搜尋'
    end
  end
  def product_type_path(type)
    "#{fireworks_path}/type/#{type}"
  end
  def product_type_path_admin(type)
    "#{admin_fireworks_path}/type/#{type}"
  end
  def products_navs
    render_list do |li|
      li << link_to(product_type_chinese('stage'), product_type_path('stage'),:class=>'nav-link')
      li << link_to(product_type_chinese('air'), product_type_path('air'),:class=>'nav-link')
      li << link_to(product_type_chinese('special'), product_type_path('special'),:class=>'nav-link' )
      li << link_to(product_type_chinese('project'), product_type_path('project'),:class=>'nav-link')
      li << link_to(product_type_chinese('gadge'), product_type_path('gadge'),:class=>'nav-link')
      li << link_to(product_type_chinese('mech'), product_type_path('mech'),:class=>'nav-link')
    end
    # content_tag(:ul,:class => 'nav nav-tabs') do
    #   s = ""
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
  def products_navs_admin
    render_list :class => "nav nav-tabs" do |li|
      li << link_to(product_type_chinese('stage'), product_type_path_admin('stage'))
      li << link_to(product_type_chinese('air'), product_type_path_admin('air'))
      li << link_to(product_type_chinese('special'), product_type_path_admin('special') )
      li << link_to(product_type_chinese('project'), product_type_path_admin('project'))
      li << link_to(product_type_chinese('gadge'), product_type_path_admin('gadge'))
      li << link_to(product_type_chinese('mech'), product_type_path_admin('mech'))
      li << link_to('投影片', admin_slides_path)
    end
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
    %Q{<img src="http://img.youtube.com/vi/#{ youtube_id }/0.jpg" class="img-thumbnail" width='100'>}.html_safe
  end
end
