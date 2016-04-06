module ApplicationHelper

 def youtube_id
    YouTubeAddy.extract_video_id(@post.link)
  end

end
