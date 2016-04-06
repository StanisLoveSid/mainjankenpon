class PostMailer < ActionMailer::Base

  def post_created(user)
	mail(to: user.email,
		 from: "forumjankenpon@gmail.com",
		 subject: "Forum",
		 body: "Post is successfully created"

		 )
  end

end
