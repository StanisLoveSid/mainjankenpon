module ApplicationHelper

  def flash_class(level)
    case level.to_sym
    when :notice then "alert alert-info"
    when :success then "alert alert-success"
    when :error then "alert alert-error"
    when :alert then "alert alert-error"
    end
  end


 def youtube_id
    YouTubeAddy.extract_video_id(@post.link)
  end

end
