module FireworksHelper
  def sub_type_chinese(sub_type)
    Firework.product_sub_type.key(sub_type)
  end
  def product_type_chinese(type)
    chinese = Firework.product_types.key(type)
    if chinese
      chinese
    else
      "搜尋 Search"
    end
  end

  def products_navs
    render_list do |li|
      Firework.product_types.each do |type_chinese_name,type_code|
        if type_code == 'gadge'
          li << link_to(type_chinese_name, sub_type_fireworks_path(type_code,'fake'),:class=>'nav-link')
        else
          li << link_to(type_chinese_name, type_fireworks_path(type_code),:class=>'nav-link')
        end
      end
    end
  end
  def products_navs_admin
    render_list :class => "nav nav-pills nav-justified" do |li|
      li << link_to('最新活動', admin_events_path)
      li << link_to('投影片', admin_slides_path)
      Firework.product_types.each do |type_chinese_name,type_code|
        li << link_to(type_chinese_name, type_admin_fireworks_path(type_code))
      end
    end
  end
  #    {'真假火焰類' => 'fake', '啟動魔球類' => 'ball','啟動台類' => 'site','其他道具類' => 'other'}

  def sub_navs_admin(product_type)
    render_list :class => "pager" do |li|
      Firework.product_sub_type.each  do |sub_type_chinese_name, sub_type_code|
        li << link_to(sub_type_chinese_name, sub_type_admin_fireworks_path(product_type,sub_type_code))
      end
    end
  end
  def sub_navs(product_type)
    render_list :class => "breadcrumb" do |li|
      Firework.product_sub_type.each  do |sub_type_chinese_name, sub_type_code|
        li << link_to(sub_type_chinese_name, sub_type_fireworks_path(product_type,sub_type_code))
      end
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
    %Q{<img src="http://img.youtube.com/vi/#{ youtube_id }/0.jpg">}.html_safe
  end
  def youtube_thumbnail_small(youtube_url)
    if youtube_url[/youtu\.be\/([^\?]*)/]
      youtube_id = $1
    else
      # Regex from # http://stackoverflow.com/questions/3452546/javascript-regex-how-to-get-youtube-video-id-from-url/4811367#4811367
      youtube_url[/^.*((v\/)|(embed\/)|(watch\?))\??v?=?([^\&\?]*).*/]
      youtube_id = $5
    end
    %Q{<img src="http://img.youtube.com/vi/#{ youtube_id }/1.jpg">}.html_safe
  end
  def youtube_id(youtube_url)
    if youtube_url[/youtu\.be\/([^\?]*)/]
      youtube_id = $1
    else
      # Regex from # http://stackoverflow.com/questions/3452546/javascript-regex-how-to-get-youtube-video-id-from-url/4811367#4811367
      youtube_url[/^.*((v\/)|(embed\/)|(watch\?))\??v?=?([^\&\?]*).*/]
      youtube_id = $5
    end
    if youtube_id.blank?
      "y-FhpMilLXs3I"
    else
      "y-" + youtube_id
    end
  end
end
